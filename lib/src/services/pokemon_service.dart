import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/src/models/pokemon_model.dart';

class PokemonService {
  String baseUrl = 'https://pokeapi.co/api/v2/pokemon/';
  Future<PokemonModel> getPokemon(String name) async{
    
    final response = await http.get(Uri.parse('$baseUrl/$name'));

    if(response.statusCode != 200){
throw Exception('Pokemon não encontrado');
    }
    final data = jsonDecode(response.body);

    return PokemonModel.fromJson(data);
    
  } 

}