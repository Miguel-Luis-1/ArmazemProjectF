import 'package:armazemf/app/stores/funcionarios_page_store.dart';
import 'package:armazemf/app/widgets/base_page.dart';
import 'package:flutter/material.dart';
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
    if (isGerente == 0) {
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
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Center(
              child:
                  Text('${store.funcionarios.length} funcionários cadastrados'),
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
                      onTap: () {},
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
