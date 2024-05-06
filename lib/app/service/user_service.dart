import 'package:dio/dio.dart';

class UserService {
  final dio = Dio();

  cadastro(Map credenciais) async {
    // Rodar a API assim
    // php artisan serve --host=0.0.0.0 --port=8000
    // Colocar o ip de minha maquina
    return dio.post(
      'http://192.168.15.158:8000/api/createuser',
      data: credenciais,
    );
  }

  login(Map credenciais) async {
    
    return dio.post(
      'http://192.168.15.158:8000/api/createuser',
      data: credenciais,
    );
  }
}
