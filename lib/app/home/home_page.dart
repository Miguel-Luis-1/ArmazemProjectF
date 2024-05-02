// ignore_for_file: file_names

import 'package:armazemf/app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F1F2),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color:Colors.white,
        ),
        backgroundColor: const Color(0xFF247BA0),
        title: const Text('Lista de produtos',
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
