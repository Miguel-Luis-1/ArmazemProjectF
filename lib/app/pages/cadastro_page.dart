import 'dart:developer';

import 'package:armazemf/app/stores/cadastro_page_store.dart';
import 'package:armazemf/app/widgets/back_dialog.dart';
import 'package:armazemf/app/widgets/base_page.dart';
import 'package:armazemf/app/widgets/input_base.dart';
import 'package:flutter/material.dart';
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
                  InputBase(
                    title: 'Nome',
                    alert: 'Por favor, insira seu nome',
                    textController: store.nomeController,
                  ),
                  InputBase(
                    title: 'Email',
                    alert: 'Por favor, insira seu email',
                    textController: store.emailController,
                  ),
                  InputBase(
                    title: 'Senha',
                    alert: 'Por favor, insira sua senha',
                    textController: store.senhaController,
                    isPassword: true,
                  ),
                  InputBase(
                    title: 'Código da Empresa',
                    alert: 'Por favor, insira o codigo',
                    textController: store.codigoEmpresaController,
                    isNuber: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.grey), // Adiciona cor à borda
                      ),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width > 600
                            ? MediaQuery.of(context).size.width * 0.9
                            : MediaQuery.of(context).size.width,
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween, // Adicionado aqui
                        children: [
                          const Text('Perfil de gerente ?'),
                          Switch(
                            activeColor: const Color(0xFF247BA0),
                            value: store.isGerente,
                            onChanged: (value) {
                              store.isGerente = value;
                              log(value.toString());
                            },
                          ),
                        ],
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
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            store.cadastro(context);
                          }
                        },
                        child: const Text(
                          'Cadastrar',
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
