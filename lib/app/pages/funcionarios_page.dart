import 'package:armazemf/app/stores/funcionarios_page_store.dart';
import 'package:armazemf/app/widgets/base_page.dart';
import 'package:armazemf/app/widgets/dialog_base.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FuncionariosPage extends StatefulWidget {
  const FuncionariosPage({super.key});

  @override
  State<FuncionariosPage> createState() => _FuncionariosPageState();
}

class _FuncionariosPageState extends State<FuncionariosPage> {
  final FuncionariosPageStore store = Modular.get<FuncionariosPageStore>();

  @override
  void initState() {
    store.dispose();
    store.getFuncionarios(context);
    super.initState();
  }

  isGerente(isGerente) {
    if (isGerente == 1) {
      return 'Sim';
    } else {
      return 'Não';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BasePage(
        title: 'Funcionários',
        drawer: true,
        body: store.isLoading
            ? const Center(
                child: Text('Carregando...'),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                        '${store.funcionarios.length} funcionários cadastrados'),
                  ),
                  Visibility(
                    visible: store.funcionarios.isNotEmpty,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: store.funcionarios.length,
                      itemBuilder: (context, index) {
                        var funcionario = store.funcionarios[index];
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            title: Text(funcionario['name']),
                            subtitle: Text(
                                'Gerente: ${isGerente(funcionario['is_gerente'])}'),
                            onTap: () {
                              store.getFuncionari(funcionario['id'].toString());
                              Asuka.showDialog(
                                builder: (context) => DialogBase(
                                  title: funcionario['name'],
                                  content: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      50,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: funcionario['is_gerente'] == 1
                                        ? const Center(
                                            child: Text(
                                                'Não é possível editar ou excluir um funcionário gerente'),
                                          )
                                        : Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  store.promover(
                                                      funcionario['id']
                                                          .toString(),
                                                      context);
                                                },
                                                style: const ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.blue)),
                                                child: const Text(
                                                  'Promover',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  store.delete(
                                                      funcionario['id']
                                                          .toString(),
                                                      context);
                                                },
                                                style: const ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.red)),
                                                child: const Text(
                                                  'Deletar',
                                                  style: TextStyle(
                                                      color: Colors.white),
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
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
