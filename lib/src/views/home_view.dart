import 'package:flutter/material.dart';
import 'package:pokemon/src/controllers/pokemon_controller.dart';
import 'package:pokemon/src/widgets/card_pokemon.dart';
import 'package:pokemon/src/widgets/styled_text_field.dart';
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
            StyledTextField(textEditingController: _inputController),
            const SizedBox(height: 10),
            _controller.loading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () =>
                        _controller.getPokemon(_inputController.text.trim()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white
                    ),
                    child: Text('Buscar'),
                  ),
            const SizedBox(height: 10),

            if (_controller.pokemon != null) ...[
              CardPokemon(pokemon: _controller.pokemon!, description: _controller.description!,),
              
            ] else if (_controller.pokemon == null &&
                _inputController.text.isNotEmpty &&
                !_controller.loading) ...[
              Text('Pokemon não encontrado! tente novamente'),
            ],
          ],
        ),
      ),
    );
  }
}
