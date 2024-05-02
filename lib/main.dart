import 'package:armazemf/app/modules/app_modue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main(){
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Armazem Project',
      theme:  ThemeData.light(),
      routerConfig: Modular.routerConfig,
    ); //added by extension 
  }
}

