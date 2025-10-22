import 'package:flutter/material.dart';
import 'package:pokemon/src/controllers/pokemon_controller.dart';
import 'package:pokemon/src/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PokemonController(),
      child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
