import 'package:armazemf/app/stores/base_page_store.dart';
import 'package:armazemf/app/widgets/un_connect_dilog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BasePage extends StatefulWidget {
  final Widget body;
  final String title;
  final bool bntAdd;
  final bool drawer;

  const BasePage({
    super.key,
    required this.body,
    required this.title,
    this.bntAdd = false,
    this.drawer = true,
  });

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  BasePageStore store = Modular.get<BasePageStore>();

  @override
  void initState() {
    store.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
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
        drawer: widget.drawer
            ? Drawer(
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
                    Card(
                      color: Colors.white,
                      child: store.user == null
                          ? ListTile(
                              title: const Text('Você não está logado'),
                              subtitle: const Text(
                                  'Clique aqui para logar ou se cadastrar'),
                              onTap: () => unConnectDilog(context),
                            )
                          : ListTile(
                              title: Text('Nome: ${store.user!.nome}'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email: ${store.user!.email}'),
                                  Visibility(
                                    visible: store.isGerente,
                                    child: const Text('Perfil Gerente'),
                                  ),
                                ],
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
                          Modular.to.pushNamed('/');
                        }
                      },
                    ),
                    Visibility(
                      visible: store.isGerente,
                      child: Column(
                        children: [
                          const Divider(),
                          ListTile(
                            title: const Text('Funcionários'),
                            leading: const Icon(Icons.group),
                            onTap: () {
                              if (Modular.to.path == '/funcionarios') {
                                Navigator.pop(context);
                              } else {
                                Modular.to.pushNamed('/funcionarios');
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Configurações'),
                      leading: const Icon(Icons.settings),
                      onTap: () {
                        if (Modular.to.path == '/config') {
                          Navigator.pop(context);
                        } else {
                          Modular.to.pushNamed('/config');
                        }
                      },
                    ),
                  ],
                ),
              )
            : null,
        body: widget.body,
        floatingActionButton: Visibility(
          visible: widget.bntAdd,
          child: FloatingActionButton(
            onPressed: () => Modular.to.pushNamed('/create'),
            backgroundColor: const Color(0xFF247BA0),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}

mixin contextDrawer {}
