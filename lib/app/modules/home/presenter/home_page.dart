import 'package:flutter/material.dart';
import 'package:flutter_state_management/app/core/shared/services/pokemon_services.dart';
import 'package:flutter_state_management/app/modules/home/domain/entities/pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = PokemonServices();

  var isLoading = false;
  var error = '';
  var pokemons = <Pokemon>[];

  getPokemons() async {
    setState(() {
      isLoading = true;
      error = '';
    });
    try {
      final pokemons = await service.get();
      setState(() {
        this.pokemons = pokemons;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container();

    if (isLoading) {
      body = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (error.isNotEmpty) {
      body = Center(
        child: ElevatedButton(
          onPressed: getPokemons,
          child: const Text('Get pokemons'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: body,
    );
  }
}
