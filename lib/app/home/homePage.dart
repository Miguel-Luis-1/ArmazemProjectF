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
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Lista de produtos', 
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,        
        ),
        textDirection: TextDirection.ltr
        ),
      ),
      body: const Column(
        children:[
          Text('data',),
        ]
      ),
    );
  }
}