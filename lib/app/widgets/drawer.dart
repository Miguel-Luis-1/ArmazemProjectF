import 'package:flutter/material.dart';

class DrawerBase extends StatefulWidget {
  const DrawerBase({super.key});

  @override
  State<DrawerBase> createState() => _DrawerBaseState();
}

class _DrawerBaseState extends State<DrawerBase> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF247BA0),
              ),
              child: Text('Cabeçalho do Menu'),
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
      );
  }
}