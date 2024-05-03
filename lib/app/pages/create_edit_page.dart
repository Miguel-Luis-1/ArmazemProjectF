import 'dart:developer';

import 'package:armazemf/app/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateEditPage extends StatefulWidget {
  const CreateEditPage({super.key});

  @override
  State<CreateEditPage> createState() => _CreateEditPageState();
}

class _CreateEditPageState extends State<CreateEditPage> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) => _showBackDialog(),
        child: const BasePage(
          title: 'Criar Produto',
          drawer: false,
          body: Column(
            children: [
              Text('data'),
            ],
          ),
        ),
      );
    });
  }

  void _showBackDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Você deseja sair?'),
          content: const Text(
            'Você ira perder tudo que fez!',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'cancelar',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text(
                'Sair',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
