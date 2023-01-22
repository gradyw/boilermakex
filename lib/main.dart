import 'package:flutter/material.dart';

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
        primarySwatch: Colors.indigo,
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
  var phrase = "this is what you just said";

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      phrase = "new phrase";
    });
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
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      '$_counter bad words',
                      style: const TextStyle(color: Colors.white, fontSize: 70),
                    ),
                  ),
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
              child: Icon(Icons.refresh, color: Colors.white)),
          ElevatedButton(
              onPressed: _listen,
              child: Icon(Icons.mic, color: Colors.white)),
          ElevatedButton(
              onPressed: _stopListen,
              child: Icon(Icons.square, color: Colors.white)),
        ],
      )
    );

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black87,
              Colors.black87,
            ]
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              counterSection,
              buttonSection,
              const SizedBox(height: 50,),
              Text(phrase, style: const TextStyle(fontSize: 50, color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
