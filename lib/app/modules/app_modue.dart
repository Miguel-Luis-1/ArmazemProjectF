import 'package:armazemf/app/home/home_page.dart';
import 'package:armazemf/app/pages/cadastro_page.dart';
import 'package:armazemf/app/pages/configuracoes_page.dart';
import 'package:armazemf/app/pages/create_edit_page.dart';
import 'package:armazemf/app/pages/login_page.dart';
import 'package:armazemf/app/stores/back_dialog_store.dart';
import 'package:armazemf/app/stores/cadastro_page_store.dart';
import 'package:armazemf/app/stores/configuracoes_store.dart';
import 'package:armazemf/app/stores/create_edit_page_store.dart';
import 'package:armazemf/app/stores/home_page_store.dart';
import 'package:armazemf/app/stores/login_page_store.dart';
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
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child:  (_, args) => const HomePage()),
    ChildRoute('/config', child:  (_, args) => const ConfiguracoesPage()),
    ChildRoute('/create', child:  (_, args) => const CreateEditPage()),
    ChildRoute('/createuser', child:  (_, args) => const CadastroPage()),
    ChildRoute('/login', child:  (_, args) => const LoginPage()),
  ];
}
