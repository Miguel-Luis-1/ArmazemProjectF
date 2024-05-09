class User {
  int? id;
  String nome;
  String email;
  String empresaId;

  User({
    this.id,
    required this.nome,
    required this.email,
    required this.empresaId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      empresaId: json['empresa_id']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'empresa_id': empresaId,
    };
  }
}
