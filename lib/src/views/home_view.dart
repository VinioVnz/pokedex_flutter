import 'package:flutter/material.dart';
import 'package:pokemon/src/controllers/pokemon_controller.dart';
import 'package:pokemon/src/widgets/card_pokemon.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

void _searchPokemon() async {}
 TextEditingController _inputController = TextEditingController();
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    PokemonController _controller = Provider.of<PokemonController>(context);
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                label: Text('Escreva o nome de um pokemon!'),
                hintText: 'Ex: Pikachu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10,),
            _controller.loading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => _controller.getPokemon(_inputController.text.trim()),
                    child: Text('Buscar'),
                  ),
            const SizedBox(height: 10,),
            
            if(_controller.pokemon != null)...[
              CardPokemon(pokemon: _controller.pokemon!)
            ] else if(_controller.pokemon == null)...[
              Text('Pokemon não encontrado! tente novamente')
            ]
          ],
        ),
      ),
    );
  }
}
