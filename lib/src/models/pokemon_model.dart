class PokemonModel {
  int? id;
  final String name;

  final int weight;
  final int height;
  final String sprite;

  PokemonModel({this.id,required this.name, required this.weight, required this.height, required this.sprite});

  factory PokemonModel.fromJson(Map<String,dynamic> json){
    return PokemonModel(
      name: json['name'], 

      weight : json['weight'], 
      height: json['height'], 
      sprite: json['sprites']['front_default'],
      );
  }
}
