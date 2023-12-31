import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());
var intValue = Random();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Random Number Generator';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int var1 = 0;
  int max = 6;
  int min = 0;

  void _randomGenerator() {
    setState(() {
      var1 = intValue.nextInt(max - min + 1) + min;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.4,
          child: Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('Random Number Generator'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Inserir limite inferior para número aleatório:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                    onChanged: (value) {
                      min = int.parse(value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Inserir limite superior para número aleatório:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                    onChanged: (value) {
                      max = int.parse(value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Pressione o Botão para gerar número entre $min e $max',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  '$var1',
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _randomGenerator,
            tooltip: 'Generator',
            child: const Icon(Icons.start),
          ),
        ),
      ],
    );
  }
}
