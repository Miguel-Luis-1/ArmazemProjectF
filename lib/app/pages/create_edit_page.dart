import 'package:armazemf/app/stores/create_edit_page_store.dart';
import 'package:armazemf/app/widgets/back_dialog.dart';
import 'package:armazemf/app/widgets/base_page.dart';
import 'package:armazemf/app/widgets/input_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateEditPage extends StatefulWidget {
  const CreateEditPage(void log, {super.key, this.id});
  final String? id;

  @override
  State<CreateEditPage> createState() => _CreateEditPageState();
}

class _CreateEditPageState extends State<CreateEditPage> {
  final CreateEditPageStore store = Modular.get<CreateEditPageStore>();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    store.dispose();
    store.getIten(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) => backDialog(context),
        child: BasePage(
          title: store.titlePage!,
          drawer: false,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: widget.id == ''
                        ? const Text(
                            'Faça o cadastro de um item',
                            style: TextStyle(fontSize: 30),
                          )
                        : const Text(
                            'Edite o seu item',
                            style: TextStyle(fontSize: 30),
                          ),
                  ),
                  InputBase(
                    title: 'Codigo do Produto',
                    alert: 'Escreva o código',
                    textController: store.codigoController,
                    isNuber: true,
                  ),
                  InputBase(
                    title: 'Nome do Produto',
                    alert: 'Escreva o nome',
                    textController: store.nomeController,
                  ),
                  InputBase(
                    title: 'Descrição do Produto',
                    alert: 'Escreva a descrição',
                    textController: store.descricaoController,
                  ),
                  InputBase(
                    title: 'Categoria do Produto',
                    alert: 'Escreva a categoria',
                    textController: store.categoriaController,
                  ),
                  InputBase(
                    title: 'Preço do Produto',
                    alert: 'Escreva o Preço',
                    textController: store.precoController,
                    isNuber: true,
                  ),
                  InputBase(
                    title: 'Quantidade de unidades do Produto',
                    alert: 'Escreva a quantidade',
                    textController: store.qtdunitariaController,
                    isNuber: true,
                  ),
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
                          if (_formKey.currentState!.validate()) {
                            if (widget.id == '') {
                              store.create(context);
                            } else {
                              store.edit(context);
                            }
                          }
                        },
                        child: widget.id == ''
                            ? const Text(
                                'Cadastrar',
                                style: TextStyle(color: Colors.white),
                              )
                            : const Text(
                                'Editar',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
