import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/model/pokemons.dart';

class Repository {
  Future<List<Pokemon>> getPokemons() async {
    Uri url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');

    List<Pokemon> listadePokemons = [];
    final resultado = await http.get(url);

    if (resultado.statusCode == 200) {
      Map json = const JsonDecoder().convert(resultado.body);

      // ignore: avoid_function_literals_in_foreach_calls
      (json['data'] as List).forEach((element) {
        listadePokemons.add(Pokemon.fromJson(element));
      });
      return listadePokemons;
    }
    return listadePokemons;
  }
}
