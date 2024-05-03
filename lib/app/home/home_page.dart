import 'package:armazemf/app/widgets/base_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const BasePage(
      title: "Lista de Produtos",
      body: Column(
        children: [Text('data')],
      ),
    );
  }
}
