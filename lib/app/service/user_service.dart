import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Dio dio = Dio();
   static const baseURL =  String.fromEnvironment('BASE_API_URL',
      defaultValue: 'http://localhost:8000/api');
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
      '$baseURL/createuser',
      data: credenciais,
    );
  }

  Future login(Map credenciais, BuildContext context) async {
    try {
      var response = await dio.post('$baseURL/login', data: credenciais);
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
      log('Erro: $e');
    }
  }

  Future getUserByToken() async {
    await dio.get('$baseURL/tokenuser').then((value) => value.data);
  }

  Future logout() async {
    try {
      return await dio.post('$baseURL/logout').then((value) async {
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
      log('Erro: $e');
    }
  }

  Future showUserById(String id) async {
    try {
      Response response;
      response = await dio.get('$baseURL/showoneuser/$id');
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

  Future showFuncionarios(String empresaId) async {
    try {
      Response response;
      response = await dio.get('$baseURL/showoneempresaf/$empresaId');
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
      response = await dio.get('$baseURL/showoneuser/$userId');
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
      response = await dio.delete('$baseURL/deleteuser/$userId');
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

  Future promoverFuncionario(String userId) async {
    try {
      Map credenciais = {
        'is_gerente': true,
      };
      Response response;
      response = await dio.put(
        '$baseURL/edituser/$userId',
        data: credenciais,
      );
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
