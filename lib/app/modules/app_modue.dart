import 'dart:developer';

import 'package:armazemf/app/home/home_page.dart';
import 'package:armazemf/app/pages/cadastro_page.dart';
import 'package:armazemf/app/pages/configuracoes_page.dart';
import 'package:armazemf/app/pages/create_edit_page.dart';
import 'package:armazemf/app/pages/funcionarios_page.dart';
import 'package:armazemf/app/pages/login_page.dart';
import 'package:armazemf/app/pages/show_item_page.dart';
import 'package:armazemf/app/stores/back_dialog_store.dart';
import 'package:armazemf/app/stores/base_page_store.dart';
import 'package:armazemf/app/stores/cadastro_page_store.dart';
import 'package:armazemf/app/stores/configuracoes_store.dart';
import 'package:armazemf/app/stores/create_edit_page_store.dart';
import 'package:armazemf/app/stores/funcionarios_page_store.dart';
import 'package:armazemf/app/stores/home_page_store.dart';
import 'package:armazemf/app/stores/login_page_store.dart';
import 'package:armazemf/app/stores/show_item_page_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomePageStore()),
    Bind.singleton((i) => ConfiguracoesStore()),
    Bind.singleton((i) => CadastroPageStore()),
    Bind.singleton((i) => LoginPageStore()),
    Bind.singleton((i) => CreateEditPageStore()),
    Bind.singleton((i) => BackDialogStore()),
    Bind.singleton((i) => ShowItemPageStore()),
    Bind.singleton((i) => FuncionariosPageStore()),
    Bind.singleton((i) => BasePageStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
    ChildRoute('/config', child: (_, args) => const ConfiguracoesPage()),
    ChildRoute('/create/:id', child: (_, args) {
      log(args.params.toString(), name: 'Id');
      return CreateEditPage(
        // ignore: void_checks
        log,
        id: args.params['id'].toString(),
      );
    }),
    ChildRoute('/createuser', child: (_, args) => const CadastroPage()),
    ChildRoute('/login', child: (_, args) => const LoginPage()),
       ChildRoute('/show/item/:id', child: (_, args) {
      log(args.params.toString(), name: 'Id');
      return ShowItemPage(
        id: args.params['id'].toString(),
      );
    }),
    ChildRoute('/funcionarios', child: (context, args) => const FuncionariosPage()),

  ];
}
