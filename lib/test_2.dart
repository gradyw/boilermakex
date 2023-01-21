import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget counterSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'COUNTER OF WORDS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'swear words.',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {print("Reset Counter");},
              child: const Text("Reset")
          ),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget audioTimer = Center(
      child: Text(
        _timerText,
        style: const TextStyle(fontSize: 70, color: Colors.red),
      ),
    );

    /**
    Widget audioButtons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAudioButtons(Colors.green, Icons.play_arrow, 'Play'),
        _buildAudioButtons(color, Icons.stop, 'Stop'),
        _buildAudioButtons(Colors.red, Icons.circle, 'Record'),
      ],
    );
        **/
    Widget audioButtons = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _createAudioButton(Icons.mic, Colors.red, startRecording,
        ),
        const SizedBox(
          width: 30,
        ),
        _createAudioButton(Icons.stop, Colors.red, stopRecording,
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );

    bool _playAudio = false;

    Widget playPauseButtons = ElevatedButton.icon(
      style:
        ElevatedButton.styleFrom(elevation: 9.0,
            backgroundColor: Colors.red
        ), onPressed: () {
        setState(() {
          _playAudio = !_playAudio;
        });
        if (_playAudio) playFunc();
        if (!_playAudio) stopPlayFunc();
      },
        icon: _playAudio ? Icon(Icons.stop,) : Icon(Icons.stop),
      label: _playAudio

    );

    return MaterialApp(
      title: 'Virtual Swear Jar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Column(
          children: [
            counterSection,
            audioTimer,
            audioButtons,
            playPauseButtons,
          ],
        ),
      ),
    );
  }

  Column _buildAudioButtons(Color color, IconData icon, String label){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color:color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  ElevatedButton _createAudioButton(
      IconData icon, Color color, Function onPressFunc
  ){
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(6.0), backgroundColor: Colors.white,
        side: const BorderSide(
          color: Colors.red,
          width: 4.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {print("button pressed");},//onPressFunc,
      icon: Icon(
        icon,
        color: color,
      ),
      label: const Text(''),
    );
  }

}

