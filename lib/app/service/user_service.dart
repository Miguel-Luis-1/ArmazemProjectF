import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Dio dio = Dio();
  UserService() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        String? token = sharedPreferences.getString('token');
        options.headers.addAll({
          'Authorization': 'Bearer $token',
        });
        handler.next(options);
      },
    ));
  }

  cadastro(Map credenciais) async {
    return dio.post(
      'http://192.168.15.158:8000/api/createuser',
      data: credenciais,
    );
  }

  Future login(Map credenciais, BuildContext context) async {
    try {
      var response = await dio.post('http://192.168.15.158:8000/api/login',
          data: credenciais);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString(
          'token', response.data['token'].toString());
      await sharedPreferences.setString(
          'user', jsonEncode(response.data['user']));
      log(sharedPreferences.getString('token').toString(), name: 'Token');
      log(sharedPreferences.getString('user').toString(), name: 'User');
      Modular.to.pushNamed('/');
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        log('1Erro: ${e.response!.data}');
        if (e.response!.data['data']['Status'].toString() ==
            'Senha incoreta!') {
          final snackBar =
              SnackBar(content: Text('${e.response!.data['data']['Status']}'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (e.response!.data['data']['Status'].toString() ==
            'Usuario não encontrado!') {
          final snackBar =
              SnackBar(content: Text('${e.response!.data['data']['Status']}'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          log('Deu ruin!');
          log(e.response!.data['data']['Status'].toString());
        }
      } else {
        log('2Erro: ${e.message}');
      }
    } catch (e) {
      log('Erro: ${e}');
    }
  }

  Future getUserByToken() async {
    await dio
        .get('http://192.168.15.158:8000/api/tokenuser')
        .then((value) => value.data);
  }

  Future logout() async {
    try {
      return await dio
          .post('http://192.168.15.158:8000/api/logout')
          .then((value) async {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.remove('user');
        log(value.toString());
        Modular.to.pushNamed('/');
      });
    } on DioException catch (e) {
      if (e.response != null) {
        log('1Erro: ${e.response!.data}');
      } else {
        log('2Erro: ${e.message}');
      }
    } catch (e) {
      log('Erro: ${e}');
    }
  }

  Future showUserById(String id) async {
    try {
      Response response;
      response =
          await dio.get('http://192.168.15.158:8000/api/showoneuser/$id');
      log(response.toString());
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        log('1Erro: ${e.response!.data}');
      } else {
        log('2Erro: ${e.message}');
      }
    } catch (e) {
      log('Erro: ${e}');
    }
  }

  Future showFuncionarios(String empresaId) async {
    try {
      Response response;
      response = await dio
          .get('http://192.168.15.158:8000/api/showoneempresaf/$empresaId');
      log(response.toString());
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        log('1Erro: ${e.response!.data}');
      } else {
        log('2Erro: ${e.message}');
      }
    } catch (e) {
      log('Erro: $e');
    }
  }

  Future showFuncionario(String userId) async {
    try {
      Response response;
      response =
          await dio.get('http://192.168.15.158:8000/api/showoneuser/$userId');
      log(response.toString());
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        log('1Erro: ${e.response!.data}');
      } else {
        log('2Erro: ${e.message}');
      }
    } catch (e) {
      log('Erro: $e');
    }
  }

  Future deleteUser(String userId) async {
    try {
      Response response;
      response =
          await dio.delete('http://192.168.15.158:8000/api/deleteuser/$userId');
      log(response.toString());
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        log('1Erro: ${e.response!.data}');
      } else {
        log('2Erro: ${e.message}');
      }
    } catch (e) {
      log('Erro: $e');
    }
  }
}
