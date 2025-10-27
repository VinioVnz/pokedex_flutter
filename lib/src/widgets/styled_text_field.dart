import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final TextEditingController textEditingController;

  const StyledTextField({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.red),
        label: Text('Escreva o nome do seu pokemon!'),
        hintText: 'Ex: Pikachu',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.catching_pokemon_outlined, color: Colors.red),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
