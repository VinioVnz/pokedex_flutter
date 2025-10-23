import 'package:flutter/material.dart';
import 'package:pokemon/src/models/pokemon_model.dart';
import 'package:pokemon/src/services/pokemon_service.dart';

class PokemonController extends ChangeNotifier {
  final PokemonService _service = PokemonService();

  PokemonModel? _pokemon;
  String? _description;
  bool _loading = false;
  PokemonModel? get pokemon => _pokemon;
  bool get loading => _loading;
  String? get description => _description;

  Future<void> getPokemon(String name) async {
    if(name.isEmpty){
      return;
    }
    _loading = true;
    notifyListeners();

    _pokemon = await _service.getPokemon(name);
    _description = await _service.getPokemonDesc(name);
    //print('DESCRICAO: $_description');
    //print("IMAGE:${_pokemon!.sprite}");
    _loading = false;
    notifyListeners();
  }

  
}
