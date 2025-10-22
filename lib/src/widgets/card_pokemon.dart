import 'package:flutter/material.dart';
import 'package:pokemon/src/models/pokemon_model.dart';

class CardPokemon extends StatelessWidget {
  final PokemonModel pokemon;

  const CardPokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              pokemon.name.toUpperCase(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 10),

            Image.network(pokemon.sprite, height: 120, fit: BoxFit.contain),

            SizedBox(height: 10),

            //Text('Tipo: ${pokemon.type}'),
            Text('Altura: ${pokemon.height}'),
            Text('Peso: ${pokemon.weight}'),
          ],
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return Colors.orange;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.amber;
      case 'psychic':
        return Colors.purple;
      case 'rock':
        return Colors.brown;
      case 'ground':
        return Colors.brown.shade300;
      case 'poison':
        return Colors.purpleAccent;
      case 'bug':
        return Colors.lightGreen;
      case 'fairy':
        return Colors.pinkAccent;
      default:
        return Colors.grey;
    }
  }
}
