import 'package:armazemf/app/widgets/base_page.dart';
import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  @override
  Widget build(BuildContext context) {
    return const BasePage(
       title: 'Configurações',
      body: Column(
        children: [
          Text("c"),
        ],
      ),
    );
  }
}
