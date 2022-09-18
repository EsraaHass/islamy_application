import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamy_app/home/radios/RadioResponse.dart';
import 'package:islamy_app/home/radios/radio_controller.dart';
import 'package:http/http.dart' as http;

class RadiosTab extends StatefulWidget {
  @override
  State<RadiosTab> createState() => _RadiosState();
}

class _RadiosState extends State<RadiosTab> {
  late Future<RadioResponse> radioResponse;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    radioResponse = fetchRadio();
    audioPlayer = AudioPlayer();
  }

  play(String url) async {
    await audioPlayer.play(url);
  }

  pause() async {
    await audioPlayer.pause();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RadioResponse>(
      future: radioResponse,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Image.asset('assets/images/radio_image.png')),
                Expanded(
                    flex: 2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: PageScrollPhysics(),
                      itemBuilder: (context, index) {
                        return RadioController(
                          radiusResponse: snapshot.data!.radios![index],
                          play: play,
                          pause: pause,
                        );
                      },
                      itemCount: snapshot.data!.radios!.length,
                    ))
              ],
            ),
          );
        } else if (snapshot.hasError) {
          print('error is ' + snapshot.error.toString());
          return Center(
            child: IconButton(
                onPressed: () {
                  radioResponse = fetchRadio();
                },
                icon: Icon(Icons.refresh)),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<RadioResponse> fetchRadio() async {
    var uri = Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return RadioResponse.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      // jsonDecode(utf8.decode(response.bodyBytes))
      throw Exception('Failed to load Radio');
    }
  }
}
