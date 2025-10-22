import 'package:flutter/material.dart';
import 'package:pokemon/src/models/pokemon_model.dart';

class CardPokemon extends StatelessWidget {
  final PokemonModel pokemon;

  const CardPokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    List<String> tipos = pokemon.types;
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
                color: _getTypeColor(tipos[0]),
              ),
            ),
            SizedBox(height: 10),

            //Image.network(pokemon.sprite, height: 120, fit: BoxFit.contain),
            Image(
              image: NetworkImage(pokemon.sprite),
              height: 120,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 10),
            for (var tipo in pokemon.types) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tipo(s): $tipo',
                    style: TextStyle(color: _getTypeColor(tipo)),
                  ),
                  Icon(_getTypeIcon(tipo), color: _getTypeColor(tipo)),
                ],
              ),
            ],
            Text('Altura: ${pokemon.height} cm'),
            Text('Peso: ${pokemon.weight} kg'),
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

  IconData _getTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return Icons.local_fire_department_sharp;
      case 'water':
        return Icons.water_drop_rounded;
      case 'grass':
        return Icons.grass_outlined;
      case 'electric':
        return Icons.electric_bolt_sharp;
      case 'psychic':
        return Icons.psychology;
      case 'rock':
        return Icons.terrain;
      case 'ground':
        return Icons.landscape;
      case 'poison':
        return Icons.science;
      case 'bug':
        return Icons.bug_report;
      case 'fairy':
        return Icons.star;
      default:
        return Icons.catching_pokemon;
    }
  }
}
