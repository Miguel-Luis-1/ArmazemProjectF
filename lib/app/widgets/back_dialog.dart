import 'package:armazemf/app/stores/back_dialog_store.dart';
import 'package:armazemf/app/widgets/dialog_base.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


  void backDialog(BuildContext context) {
    final BackDialogStore store = Modular.get<BackDialogStore>();
    if (!store.diaogIsOpen) {
      store.setDialogState();
      Asuka.showDialog<void>(
        builder: (BuildContext dialogcontext) {
          return DialogBase(
            title: 'Você deseja sair?',
            content: const Text(
              'Você ira perder tudo que fez!',
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'cancelar',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(dialogcontext);
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
                  Navigator.pop(context);
                  Navigator.pop(dialogcontext);
                },
              ),
            ],
          );
        },
      ).whenComplete(() => store.setDialogState());
    }
  }



