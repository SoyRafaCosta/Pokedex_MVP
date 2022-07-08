import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/presenter/pokemon_presenter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PokemonPresenter presenter;

  @override
  void initState() {
    presenter = context.read<PokemonPresenter>();
    presenter.getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 130, left: 30),
              child: const Text('Pokedex do Rafa'),
            ),
            Image.network(
                'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png',
                height: 35,
                width: 35),
          ],
        ),
      ),
      body: Consumer<PokemonPresenter>(builder: (_, p, w) {
        return Stack(children: [
          ListView.builder(
            itemCount: presenter.listadePokemons.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 10, right: 10),
                child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed('/descricao',
                          arguments: presenter.listadePokemons[index]);
                    },
                    leading: Image.network(
                      presenter.listadePokemons[index].thumbnailImage ?? '',
                      width: 50,
                      height: 50,
                    ),
                    title: Text(presenter.listadePokemons[index].name ?? '',
                        style: const TextStyle(fontSize: 18.0)),
                    trailing: Text(
                        '#${presenter.listadePokemons[index].number}',
                        style: const TextStyle(fontSize: 18.0)),
                  ),
                ),
              );
            },
          ),
          if (presenter.carregando)
            const Center(child: CircularProgressIndicator()),
        ]);
      }),
    );
  }
}
