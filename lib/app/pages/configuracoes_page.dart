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
    store.getUser();
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
            const Divider(),
            Visibility(
              visible: store.user != null,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      width: double.infinity,
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                        ),
                        onPressed: () {
                          store.getPDF();
                        },
                        child: const Text(
                          'Gerar PDF de itens',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      width: double.infinity,
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                        ),
                        onPressed: () {
                          Asuka.showDialog<void>(
                            builder: (BuildContext dialogcontext) {
                              return DialogBase(
                                title: 'Atenção',
                                content: const Text(
                                  'Você deseja excluir sua conta?',
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text(
                                      'cancelar',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(dialogcontext);
                                    },
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'Sim',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                    onPressed: () {
                                      store.deletConta();
                                      Navigator.pop(dialogcontext);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Exluir minha conta',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      width: double.infinity,
                      child: TextButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                        ),
                        onPressed: () {
                          Asuka.showDialog<void>(
                            builder: (BuildContext dialogcontext) {
                              return DialogBase(
                                title: 'Você deseja sair?',
                                content: const Text(
                                  'Você ira sair da sua conta!',
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
                                      Navigator.pop(dialogcontext);
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
                                      store.logout();
                                      Navigator.pop(dialogcontext);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Sair',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
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
