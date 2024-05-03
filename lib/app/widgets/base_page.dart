import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BasePage extends StatefulWidget {
  final Widget body;
  final String title;
  final bool bntAdd;

  const BasePage({
    super.key,
    required this.body,
    required this.title,
    this.bntAdd = false,
  });

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F1F2),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF247BA0),
        title: Text(widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textDirection: TextDirection.ltr),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF247BA0),
              ),
              child: Center(
                child: Icon(
                  Icons.inventory_outlined,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ),
            ListTile(
              title: const Text('Lista de Produtos'),
              leading: const Icon(Icons.list),
              onTap: () {
                if (Modular.to.path == '/') {
                  Navigator.pop(context);
                } else {
                  Navigator.popAndPushNamed(context, '/');
                }
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Configurações'),
              leading: const Icon(Icons.settings),
              onTap: () {
                if (Modular.to.path == '/config') {
                  Navigator.pop(context);
                } else {
                  Navigator.popAndPushNamed(context, '/config');
                }
              },
            ),
          ],
        ),
      ),
      body: widget.body,
      floatingActionButton: Visibility(
        visible: widget.bntAdd,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF247BA0),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

mixin contextDrawer {}
