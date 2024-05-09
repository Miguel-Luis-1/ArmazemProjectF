// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:armazemf/app/widgets/un_connect_dilog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future getItens(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? user = sharedPreferences.getString('user');
    try {
      if (user != null) {
        Map<String, dynamic> userMap = jsonDecode(user);
        log(userMap['empresa_id'].toString());
        Response response;
        response = await dio.get(
            'http://192.168.15.158:8000/api/showoneempresai/${userMap['empresa_id']}');
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
          default:
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.remove('user');
            unConnectDilog(context);
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
      response = await dio.get(
          'http://192.168.15.158:8000/api/showoneiten/${id}');
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

  Future creteIten(Map credenciais, String userId) async{
      try {
      Response response;
      response = await dio.post(
          'http://192.168.15.158:8000/api/createiten/${userId}',
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
