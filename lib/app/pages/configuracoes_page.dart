import 'package:armazemf/app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: const Color(0xFFE8F1F2),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color:Colors.white,
        ),
        backgroundColor: const Color(0xFF247BA0),
        title: const Text('Configurações',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.ltr),
      ),
      drawer: const DrawerBase(),
      body: const Column(children: [
        Text(
          'data',
        ),
      ]),
    );
  }
}