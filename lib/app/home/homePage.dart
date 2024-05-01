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
        backgroundColor: const Color(0xFF247BA0),
        title: const Text('Lista de produtos', 
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,        
        ),
        textDirection: TextDirection.ltr
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('Cabeçalho do Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
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