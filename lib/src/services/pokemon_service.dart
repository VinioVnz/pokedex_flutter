import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/src/models/pokemon_model.dart';

class PokemonService {
  String baseUrl = 'https://pokeapi.co/api/v2/pokemon/';
  Future<PokemonModel> getPokemon(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/$name'));

    if (response.statusCode != 200) {
      throw Exception('Pokemon não encontrado');
    }
    final data = jsonDecode(response.body);

    return PokemonModel.fromJson(data);
  }

  Future<String> getPokemonDesc(String name) async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$name'),
    );

    if (response.statusCode != 200) {
      throw Exception('Especie não encontrada');
    }

    final data = jsonDecode(response.body);
    final entries = data['flavor_text_entries'] as List;
    final flavorText =
        entries.firstWhere(
          (e) => e['language']['name'] == 'en',
          orElse: () => null,
        )?['flavor_text'] ??
        'No description found.';
    
    return flavorText.replaceAll('\n', ' ').replaceAll('\f', ' ');
  }
}
