import 'package:dio/dio.dart';
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

  login(Map credenciais) async {
    return dio.post(
      'http://192.168.15.158:8000/api/login',
      data: credenciais,
    );
  }

  Future getUserByToken() async {
    return dio.get('http://192.168.15.158:8000/api/tokenuser');
  }
}
