import 'package:armazemf/app/stores/create_edit_page_store.dart';
import 'package:armazemf/app/widgets/back_dialog.dart';
import 'package:armazemf/app/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateEditPage extends StatefulWidget {
  const CreateEditPage({super.key});

  @override
  State<CreateEditPage> createState() => _CreateEditPageState();
}

class _CreateEditPageState extends State<CreateEditPage> {
  final CreateEditPageStore store = Modular.get<CreateEditPageStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) => backDialog(context),
        child: const BasePage(
          title: 'Criar Produto',
          drawer: false,
          body: Column(
            children: [
              Text('data'),
            ],
          ),
        ),
      );
    });
  }
}
