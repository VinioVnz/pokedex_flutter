class PokemonModel {
  int? id;
  final String name;
  final List<String> types;
  final double weight;
  final double height;
  final String sprite;

  PokemonModel({
    this.id,
    required this.types,
    required this.name,
    required this.weight,
    required this.height,
    required this.sprite,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      types: List<String>.from(
        json['types'].map((t) => t['type']['name']),
      ), //rotina para pegar todos os types e colocar em uma lista
      weight:
          (json['weight'] as num).toDouble() / 10, //transformar de hg para kg
      height:
          (json['height'] as num).toDouble() * 10, //transformar de dc para cm,
      sprite: json['sprites']['front_default'],
    );
  }
}
