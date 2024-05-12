import 'package:flutter/cupertino.dart';
import 'package:voice_recorder_2/utils/headers.dart';
import 'package:flutter/services.dart';
import 'package:voice_recorder_2/utils/plugin.dart';

class VoiceChanger extends StatefulWidget {
  const VoiceChanger({super.key});

  @override
  State<VoiceChanger> createState() => _VoiceChangerState();
}

class _VoiceChangerState extends State<VoiceChanger> {
  double _pitchValue = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        title: const Text('Voice Changer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                VoiceChangerPlugin.startVoiceChanger();
              },
              child: Text('Start Voice Changer'),
            ),
            ElevatedButton(
              onPressed: () {
                VoiceChangerPlugin.stopVoiceChanger();
              },
              child: Text('Stop Voice Changer'),
            ),
            Slider(
              min: 0.5,
              max: 2.0,
              value: _pitchValue,
              onChanged: (double value) {
                setState(() {
                  _pitchValue = value;
                });
                VoiceChangerPlugin.setPitch(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
