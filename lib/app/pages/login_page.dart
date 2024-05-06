import 'package:armazemf/app/stores/login_page_store.dart';
import 'package:armazemf/app/widgets/base_page.dart';
import 'package:armazemf/app/widgets/input_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginPageStore store = Modular.get<LoginPageStore>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    store.dispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BasePage(
        drawer: false,
        title: 'Fazer login',
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
                    'Faça o Login',
                    style: TextStyle(fontSize: 30),
                  ),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    width: double.infinity,
                    child: TextButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          store.login(context);
                        }
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
