import 'package:armazemf/app/home/home_page.dart';
import 'package:armazemf/app/pages/configuracoes_page.dart';
import 'package:armazemf/app/stores/configuracoes_store.dart';
import 'package:armazemf/app/stores/home_page_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
     Bind.singleton((i) => HomePageStore()),
    Bind.singleton((i) => ConfiguracoesStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child:  (_, args) => const HomePage()),
    ChildRoute('/config', child:  (_, args) => const ConfiguracoesPage()),
  ];
}
