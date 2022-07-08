import 'package:flutter/material.dart';
import '../model/pokemons.dart';

class DescricaoPage extends StatefulWidget {
  final Pokemon? detalhe;
  const DescricaoPage({Key? key, required this.detalhe}) : super(key: key);

  @override
  State<DescricaoPage> createState() => _DescricaoPageState();
}

class _DescricaoPageState extends State<DescricaoPage> {
  @override
  Widget build(BuildContext context) {
    Pokemon? detalhe = ModalRoute.of(context)?.settings.arguments as Pokemon?;

    return Scaffold(
      appBar: AppBar(
        title: Text(detalhe?.name ?? ''),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Card(
            color: Colors.white,
            elevation: 20,
            margin: const EdgeInsets.only(
                bottom: 100, top: 20, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            '#${(detalhe?.number ?? '')}',
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                      Image.network(
                        detalhe?.thumbnailImage ?? '',
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    textAlign: TextAlign.justify,
                    detalhe?.description ?? '',
                    style: const TextStyle(fontSize: 17.0),
                  ),
                ),
                const Divider(
                  indent: 30,
                  endIndent: 30,
                  thickness: 1,
                  color: Colors.blue,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      margin: const EdgeInsets.all(5),
                      child: const Text(
                        'Tipo:',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        '${(detalhe?.type ?? '')}',
                        style: const TextStyle(fontSize: 17.0),
                      ),
                    ),
                    const Divider(
                      indent: 30,
                      endIndent: 30,
                      thickness: 1,
                      color: Colors.blue,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      margin: const EdgeInsets.all(5),
                      child: const Text(
                        'Fraquezas:',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        '${(detalhe?.weakness ?? '')}',
                        style: const TextStyle(fontSize: 17.0),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
