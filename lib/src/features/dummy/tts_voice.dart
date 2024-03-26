import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:iitm_app/src/features/dummy/input_text.dart';

class VoiceTest extends StatefulWidget {
  const VoiceTest({super.key});

  @override
  State<VoiceTest> createState() => _VoiceTestState();
}

class _VoiceTestState extends State<VoiceTest> {
  final FlutterTts flutterTts = FlutterTts();

  Map? currentVoice;
  @override
  void initState() {
    super.initState();
    initTts();
  }

  void initTts() {
    flutterTts.getVoices.then((value) {
      try {
        List<Map> voices = List<Map>.from(value);
        voices = voices.where((voice) => voice["name"].contains("en")).toList();

        setState(() {
          currentVoice = voices.first;
          setVoice(currentVoice!);
        });
      } catch (e) {
        print(e);
      }
    });
  }

  void setVoice(Map voice) {
    flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
    flutterTts.setVolume(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          flutterTts.speak(TTs_text);
        },
        child: const Icon(
          Icons.speaker_phone,
        ),
      ),
    );
  }
}
