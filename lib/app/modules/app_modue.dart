import 'package:armazemf/app/home/home_page.dart';
import 'package:armazemf/app/pages/configuracoes_page.dart';
import 'package:armazemf/app/stores/configuracoes_store.dart';
import 'package:armazemf/app/stores/home_page_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    // i.addSingleton((i) => HomePageStore());
    // i.addSingleton((i) => ConfiguracoesStore());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/config', child: (context) => const ConfiguracoesPage());
  }
}