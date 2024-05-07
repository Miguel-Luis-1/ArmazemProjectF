import 'package:flutter/foundation.dart';

class Item {
  int? id;
  int codigo;
  String nome;
  String categoria;
  String descricao;
  double preco;
  int qtdunitaria;
  String? created_at;
  String? updated_at;
  String? user_id;
  String? empresa_id;

  Item({
    this.id,
    required this.codigo,
    required this.nome,
    required this.categoria,
    required this.descricao,
    required this.preco,
    required this.qtdunitaria,
    this.created_at,
    this.updated_at,
    this.user_id,
    this.empresa_id,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      codigo: json['codigo'],
      nome: json['nome'],
      descricao: json['descricao'],
      categoria: json['categoria'],
      preco: json['preco'],
      qtdunitaria: json['qtdunitaria'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      user_id: json['user_id'],
      empresa_id: json['empresa_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codigo': codigo,
      'nome': nome,
      'categoria': categoria,
      'descricao': descricao,
      'preco': preco,
      'qtdunitaria': qtdunitaria,
      'created_at': created_at,
      'updated_at': updated_at,
      'user_id': user_id,
      'empresa_id': empresa_id,
    };
  }
}
