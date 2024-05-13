import 'dart:developer';

import 'package:armazemf/app/modules/app_modue.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


void main() async {
  try {
    return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
  } catch (e) {
    log(e.toString());
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Armazem Project',
      theme: ThemeData.light(),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      builder: Asuka.builder,
    ); //added by extension
  }
}
