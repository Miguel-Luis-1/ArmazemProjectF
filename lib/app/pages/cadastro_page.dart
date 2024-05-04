import 'package:armazemf/app/stores/cadastro_page_store.dart';
import 'package:armazemf/app/widgets/back_dialog.dart';
import 'package:armazemf/app/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();

  CadastroPageStore store = Modular.get<CadastroPageStore>();

  @override
  void initState() {
    store.dispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) => backDialog(context),
        child: BasePage(
          drawer: false,
          title: 'Fazer Cadastro',
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                    child: Text(
                      'Faça o seu cadastro',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  TextFormField(
                    controller: store.nomeController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira seu nome';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: store.emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira seu email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: store.senhaController,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, insira sua senha';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: store.codigoEmpresaController,
                    decoration: const InputDecoration(labelText: 'Código da Empresa'),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                       if (value!.isEmpty) {
                        return 'Por favor, insira o codigo';
                      }
                    }, // Only numbers can be entered
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                      }
                    },
                    child: const Text('Cadastrar'),
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

