import 'package:flutter/cupertino.dart';
import 'package:pokedex/model/pokemons.dart';
import 'package:pokedex/model/repositories/repository.dart';

class PokemonPresenter with ChangeNotifier {
  final Repository repository;

  PokemonPresenter(this.repository);

  List<Pokemon> listadePokemons = [];
  bool carregando = true;

  void getPokemons() async {
    carregando = true;
    listadePokemons = await repository.getPokemons();
    carregando = false;
    notifyListeners();
  }
}
