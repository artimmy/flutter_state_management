import '../../../modules/home/domain/entities/pokemon.dart';

class PokemonServices {
  Future<List<Pokemon>> get() async {
    return [
      const Pokemon(name: 'Charmeleon'),
      const Pokemon(name: 'Venusaur'),
      const Pokemon(name: 'Wartortle'),
      const Pokemon(name: 'Squirtle'),
      const Pokemon(name: 'Charizard'),
    ];
  }
}
