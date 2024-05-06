import 'package:armazemf/app/stores/configuracoes_store.dart';
import 'package:armazemf/app/widgets/base_page.dart';
import 'package:armazemf/app/widgets/dialog_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  final ConfiguracoesStore store = Modular.get<ConfiguracoesStore>();

  @override
  void initState() {
    store.dispose();
    // store.getUserTeste();
    //store.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BasePage(
        title: 'Configurações',
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Card(
              color: Colors.white,
              child: store.user == null
                  ? ListTile(
                      title: const Text('Você não está logado'),
                      subtitle:
                          const Text('Clique aqui para logar ou se cadastrar'),
                      onTap: () => _showOptionsDialog(),
                    )
                  : ListTile(
                      title: Text('Nome: ${store.user!.nome}'),
                      subtitle: Text('Email: ${store.user!.email}'),
                    ),
            ),
          ],
        ),
      );
    });
  }

  void _showOptionsDialog() {
    Asuka.showDialog(
      builder: (context) => DialogBase(
        title: 'Qual a ação desejada?',
        content: Padding(
          padding: const EdgeInsets.fromLTRB(
            50,
            0,
            0,
            0,
          ),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Modular.to.pushNamed('/login');
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Modular.to.pushNamed('/createuser');
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                child: const Text(
                  'Cadastro',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Ok',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
