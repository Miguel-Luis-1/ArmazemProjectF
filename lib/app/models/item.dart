
class Item {
  int? id;
  int codigo;
  String nome;
  String categoria;
  String descricao;
  String preco;
  int qtdunitaria;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? empresaId;

  Item({
    this.id,
    required this.codigo,
    required this.nome,
    required this.categoria,
    required this.descricao,
    required this.preco,
    required this.qtdunitaria,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.empresaId,
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
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      userId: json['user_id'],
      empresaId: json['empresa_id'],
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
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user_id': userId,
      'empresa_id': empresaId,
    };
  }
}
