import 'package:armazemf/app/models/item.dart';
import 'package:armazemf/app/stores/home_page_store.dart';
import 'package:armazemf/app/widgets/base_page.dart';
import 'package:armazemf/app/widgets/dialog_base.dart';
import 'package:asuka/asuka.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageStore store = Modular.get<HomePageStore>();

  @override
  void initState() {
    store.getItens(context);
    super.initState();
    store.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) => _showBackDialog(),
        child: BasePage(
            bntAdd: true,
            title: "Lista de Produtos",
            body: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Center(child: Text('${store.itens.length} itens cadastrados')),
                const SizedBox(height: 15),
                Visibility(
                  visible: store.itens.isNotEmpty,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: store.itens.length,
                    itemBuilder: (context, index) {
                      var iten = store.itens[index];
                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(iten['nome']),
                          subtitle: Text('Descrição: ${iten['descricao']}'),
                          trailing: Text(
                              'Unidades: ${iten['qtdunitaria'].toString()}'),
                          onTap: () {},
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
      );
    });
  }

  void _showBackDialog() {
    if (!store.diaogIsOpen) {
      store.setDialogState();
      Asuka.showDialog(
        builder: (BuildContext context) {
          return DialogBase(
            title: 'Você deseja sair do aplicativo?',
            content: Container(),
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
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
            ],
          );
        },
      ).whenComplete(() => store.setDialogState());
    }
  }
}
