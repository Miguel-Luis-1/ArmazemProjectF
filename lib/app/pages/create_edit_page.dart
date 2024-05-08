import 'package:armazemf/app/stores/create_edit_page_store.dart';
import 'package:armazemf/app/widgets/back_dialog.dart';
import 'package:armazemf/app/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateEditPage extends StatefulWidget {
  const CreateEditPage(void log, {super.key, this.id});
  final String? id;

  @override
  State<CreateEditPage> createState() => _CreateEditPageState();
}

class _CreateEditPageState extends State<CreateEditPage> {
  final CreateEditPageStore store = Modular.get<CreateEditPageStore>();

  @override
  void initState() {
    store.getIten(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) => backDialog(context),
        child: BasePage(
          title: store.titlePage!,
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
