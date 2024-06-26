import 'package:armazemf/app/stores/show_item_page_store.dart';
import 'package:armazemf/app/widgets/base_page.dart';
import 'package:armazemf/app/widgets/dialog_base.dart';
import 'package:armazemf/app/widgets/show_text.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class ShowItemPage extends StatefulWidget {
  const ShowItemPage({super.key, required this.id});
  final String id;

  @override
  State<ShowItemPage> createState() => _ShowItemPageState();
}

class _ShowItemPageState extends State<ShowItemPage> {
  final ShowItemPageStore store = Modular.get<ShowItemPageStore>();

  @override
  void initState() {
    store.dispose();
    store.getItem(widget.id);
    super.initState();
  }

  String formatarData(String data) {
    var inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    var inputDate = inputFormat.parse(data);

    var outputFormat = DateFormat("dd/MM/yyyy");
    var outputDate = outputFormat.format(inputDate);

    return outputDate;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BasePage(
        drawer: false,
        title: 'Produto',
        body: store.isLoading
            ? const Center(child: Text('Carregando...'))
            : Column(
                children: [
                  ListTile(
                    title: Text(store.item.nome),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Criação: ${formatarData(store.item.createdAt.toString())}'),
                        Text(
                            'Data da ultima Edição: ${formatarData(store.item.updatedAt.toString())}'),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Asuka.showDialog(
                          builder: (context) => DialogBase(
                            title: 'Qual há ação desejada?',
                            content: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                45,
                                0,
                                0,
                                0,
                              ),
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Modular.to.pushNamed('/create/${store.item.id}');
                                    },
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.blue)),
                                    child: const Text(
                                      'Editar o item',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      store.deleteItem(store.item.id.toString());
                                    },
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.red)),
                                    child: const Text(
                                      'Deletar o item',
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
                                  'Cancelar',
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
                      },
                      icon: const Icon(Icons.edit),
                      iconSize: 30,
                    ),
                    titleTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                    ),
                  ),
                  const Divider(),
                  ShowText(
                    title: 'Código do item',
                    text: store.item.codigo.toString(),
                  ),
                  ShowText(
                    title: 'Descrição',
                    text: store.item.descricao,
                  ),
                  ShowText(
                    title: 'Categoria',
                    text: store.item.categoria,
                  ),
                  ShowText(
                    title: 'Preço unitário',
                    text: 'R\$ ${store.item.preco}',
                  ),
                  ShowText(
                    title: 'Quantidade de unidades',
                    text: store.item.qtdunitaria.toString(),
                  ),
                ],
              ),
      );
    });
  }
}
