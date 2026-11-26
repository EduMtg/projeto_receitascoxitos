class Receita {
  const Receita({
    required this.id,
    required this.nome,
    this.imagem,
    this.ingredientes = const [],
    this.instrucoes = const [],
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.servings,
    this.rating,
    this.mealType = const [],
  });

  final int id;
  final String nome;
  final String? imagem;
  final List<String> ingredientes;
  final List<String> instrucoes;
  final num? prepTimeMinutes;
  final num? cookTimeMinutes;
  final int? servings;
  final num? rating;
  final List<String> mealType;

  factory Receita.fromJson(Map<String, dynamic> json) {
    return Receita(
      id: json['id'],
      nome: json['name'] ?? 'Receita sem nome',
      imagem: json['image'],
      ingredientes: List<String>.from(json['ingredients'] ?? []),
      instrucoes: List<String>.from(json['instructions'] ?? []),
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      servings: json['servings'],
      rating: json['rating'],
      mealType: List<String>.from(json['mealType'] ?? []),
    );
  }
}