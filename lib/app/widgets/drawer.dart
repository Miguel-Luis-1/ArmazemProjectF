import 'package:armazemf/app/pages/configuracoes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerBase extends StatefulWidget {
  const DrawerBase({super.key});

  @override
  State<DrawerBase> createState() => _DrawerBaseState();
}

class _DrawerBaseState extends State<DrawerBase> {
  @override
  Widget build(BuildContext contextDrawer) {
    return Drawer(
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
              Navigator.pop(contextDrawer);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Configurações'),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.popAndPushNamed(context, '/config');
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const ConfiguracoesPage()),
              // ).whenComplete(() => Navigator.pop(contextDrawer));
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
