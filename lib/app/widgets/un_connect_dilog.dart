import 'package:armazemf/app/stores/back_dialog_store.dart';
import 'package:armazemf/app/widgets/dialog_base.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void unConnectDilog(BuildContext context) {
  final BackDialogStore store = Modular.get<BackDialogStore>();
  if (!store.diaogIsOpen) {
    store.setDialogState();
    Asuka.showDialog(
      builder: (context) => DialogBase(
        title: 'Você está deslogado!',
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
    ).whenComplete(() => store.setDialogState());
  }
}
