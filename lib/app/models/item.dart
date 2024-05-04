class Item {
  int? id;
  int codigo;
  String nome;
  String categoria;
  String descricao;
  double preco;
  int qtdunitaria;

  Item({
    this.id,
    required this.codigo,
    required this.nome,
    required this.categoria,
    required this.descricao,
    required this.preco,
    required this.qtdunitaria,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      codigo: json['codigo'],
      nome: json['nome'],
      categoria: json['categoria'],
      descricao: json['descricao'],
      preco: json['preco'],
      qtdunitaria: json['qtdunitaria'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'codigo': codigo,
      'nome':nome,
      'categoria':categoria,
      'descricao': descricao,
      'preco': preco,
      'qtdunitaria': qtdunitaria,
    };
  }
}
