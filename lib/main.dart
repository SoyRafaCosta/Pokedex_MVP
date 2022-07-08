import 'package:flutter/material.dart';
import 'package:pokedex/model/repositories/repository.dart';
import 'package:pokedex/presenter/pokemon_presenter.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/view/descricao.dart';
import 'package:pokedex/view/listapok.dart';

void main() {
  final repository = Repository();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PokemonPresenter(repository),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/descricao': (context) => const DescricaoPage(
              detalhe: null,
            ),
      },
    );
  }
}
