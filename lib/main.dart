import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Virtual Swear Jar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool recording = false;
  var list = ['hey, no', 'hell yea'];
  var word = '';
  var rand = Random();

  int randum(number){
    return number;
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    word = list[randum(rand)];
  }

  void _listen(){
    setState(() {
      recording = true;
    });
  }

  void _stopListen(){
    setState(() {
      recording = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget counterSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: BigCard(counter: _counter),
                ),
              ],
            ),
          )
        ]
      )
    );

    Widget buttonSection = Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: _resetCounter,
              child: Icon(Icons.refresh)),
          //ElevatedButton(
          //    onPressed: _incrementCounter,
          //    child: Icon(Icons.add)),
          ElevatedButton(
              onPressed: _listen,
              child: Icon(Icons.mic)),
          ElevatedButton(
              onPressed: _stopListen,
              child: Icon(Icons.square)),
        ],
      )
    );

    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            counterSection,
            buttonSection,
            const SizedBox(height: 50,),
            Text(word, style: const TextStyle(fontSize: 80),),
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required int counter,
  }) : _counter = counter, super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,

      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          '$_counter bad words',
          style: style,
        ),
      ),
    );
  }
}
