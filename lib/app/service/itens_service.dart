// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:armazemf/app/widgets/un_connect_dilog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class ItensService {
  Dio dio = Dio();
  ItensService() {
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
  static const baseURL = String.fromEnvironment('BASE_API_URL',
      defaultValue: 'http://localhost:8000/api');

  Future getItens(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? user = sharedPreferences.getString('user');
    try {
      if (user != null) {
        Map<String, dynamic> userMap = jsonDecode(user);
        log(userMap['empresa_id'].toString());
        Response response;
        response =
            await dio.get('$baseURL/showoneempresai/${userMap['empresa_id']}');
        log(response.toString());
        return response;
      } else {
        unConnectDilog(context);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('1Erro: ${e.response!.data}');
        switch (e.response!.data['message'].toString()) {
          case 'Token expirado':
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.remove('user');
            unConnectDilog(context);
          case 'Token invalido':
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.remove('user');
            unConnectDilog(context);
          case 'Token de autorização não encontrado':
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.remove('user');
            unConnectDilog(context);
            break;
          case 'Empresa não tem itens cadastrados':
            const snackBar =
                SnackBar(content: Text('Empresa não tem itens cadastrados'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

          case 'Empresa não encontrada':
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.remove('user');
            final snackBar =
                SnackBar(content: Text('${e.response!.data['message']}'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Modular.to.pushNamed('/cadastro');
        }
      } else {
        log('2Erro: ${e.message}');
      }
    } catch (e) {
      log('Erro: $e');
    }
  }

  Future getItenById(String id) async {
    try {
      Response response;
      response = await dio.get('$baseURL/showoneiten/$id');
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

  Future creteIten(Map credenciais, String userId) async {
    try {
      Response response;
      response = await dio.post(
        '$baseURL/createiten/$userId',
        data: credenciais,
      );
      log(response.toString(), name: 'Response');
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

  Future deleteItem(String itemId) async {
    try {
      Response response;
      response = await dio.delete(
        '$baseURL/deleteiten/$itemId',
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

  Future editItem(Map credenciais, String itemId) async {
    try {
      Response response;
      response = await dio.put(
        '$baseURL/editeiten/$itemId',
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

  Future getPDF(String empresaId) async {
    try {
      var response = await Dio().get(
        '$baseURL/editeiten/$empresaId',
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );

      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/relatorio_de_itens.pdf');
      await file.writeAsBytes(response.data);

      log('Arquivo salvo em ${directory.path}');
    } on DioException catch (e) {
      if (e.response != null) {
        log('Erro: ${e.response!.data}');
      } else {
        log('Erro: ${e.message}');
      }
    } catch (e) {
      log('Erro: $e');
    }
  }
}
