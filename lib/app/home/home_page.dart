import 'package:armazemf/app/stores/home_page_store.dart';
import 'package:armazemf/app/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageStore store = Modular.get<HomePageStore>();
  @override
  void initState() {
    super.initState();
    store.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BasePage(
          bntAdd: true,
          title: "Lista de Produtos",
          body: Column(
            children: [
              const SizedBox(height: 15,),
              Center(child: Text('${store.itens.length} itens cadastrados')),
            ],
          ));
    });
  }
}
