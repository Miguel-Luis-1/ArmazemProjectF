import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:armazemf/app/models/user.dart';
import 'package:armazemf/app/service/itens_service.dart';
import 'package:armazemf/app/service/user_service.dart';
import 'package:armazemf/app/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'configuracoes_store.g.dart';

class ConfiguracoesStore = ConfiguracoesStoreBase with _$ConfiguracoesStore;

abstract class ConfiguracoesStoreBase with Store {
  @observable
  User? user;

  @action
  getUserTeste() {
    user = User(
      id: 1,
      nome: 'Nome do Usuário',
      email: 'email@dominio.com',
      empresaId: '0',
      isGerente: 0,
    );
  }

  @action
  getUser() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    String? dados = sharedPreferences.getString('user');
    if (dados == null) {
      log('Deslogado');
    } else {
      log(dados);
      Map<String, dynamic> userMap = jsonDecode(dados);
      user = User(
        id: userMap['id'],
        nome: userMap['name'],
        email: userMap['email'],
        empresaId: userMap['empresa_id'].toString(),
        isGerente: userMap['is_gerente'],
      );
    }
  }

  @action
  getPDF() async {
    await ItensService().getPDF(user!.empresaId.toString()).then((value) async {
      var bytes = base64Decode(value.data);
      final output = await getTemporaryDirectory();
      final file = File("${output.path}/relatorio.pdf");
      await file.writeAsBytes(bytes.buffer.asUint8List());
      // log(value.toString(), name: 'Value');
      // log(bytes.toString(), name: 'Bytes');
      Modular.to.push(MaterialPageRoute(builder: (context) {
        return Hero(
          tag: 'feedbackPDF',
          child: Observer(builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Relatório de itens'),
                actions: [
                  IconButton(
                      onPressed: () => Share.shareXFiles([XFile(file.path)]),
                      icon: const Icon(Icons.share)),
                ],
              ),
              body: PDFView(
                pdfData: bytes.buffer.asUint8List(),
              ),
            );
          }),
        );
      }));
    });
  }

  @action
  logout() async {
    await UserService().logout();
  }

  @action
  deletConta() async {
    await UserService()
        .deleteUser(user!.id.toString())
        .whenComplete(() => logout());
  }

  @action
  dispose() {
    user = null;
  }
}
