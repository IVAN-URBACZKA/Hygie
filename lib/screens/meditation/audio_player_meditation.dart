import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hygie/models/music_brain.dart';

MusicBrain musicBrain = new MusicBrain();

class AudioPlayerNavigation extends StatefulWidget {
  @override
  _AudioPlayerNavigationState createState() => _AudioPlayerNavigationState();
}

class _AudioPlayerNavigationState extends State<AudioPlayerNavigation> {

  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  bool play = true;
  Duration _duration = new Duration();
  Duration _position = new Duration();


  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  void initPlayer(){
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);

    advancedPlayer.durationHandler = (d) => setState(() {
      _duration = d;
    });

    advancedPlayer.positionHandler = (p) => setState(() {
      _position = p;
    });
  }


  void _playFile(String urlMusic) async{
    advancedPlayer = await audioCache.play(urlMusic);
    setState(() {
      play = false;
    });
  }

  void _stopFile() {
    advancedPlayer?.stop();
    setState(() {
      play = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff324278),
        body: Column(
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/meditation.jpg'),
            ),
            SizedBox(height: 60.0,),
            Text(musicBrain.getAuthorMusic(),
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Rubik',
                  fontSize: 25,
                  fontWeight: FontWeight.w300
              ),),
            SizedBox(height: 35.0,),
            Text(musicBrain.getTitleMusic(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic
              ),),
            SizedBox(height: 60.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.skip_previous,color: Colors.white,size: 45,),
                play == true ? IconButton(
                    icon: Icon(Icons.play_arrow),
                    color: Colors.white,
                    iconSize: 45,
                    onPressed: () {
                        _playFile(musicBrain.getUrlMusic());
                    })
                    :
                IconButton(
                  icon: Icon(Icons.stop),
                  color: Colors.white,
                  iconSize: 45,
                  onPressed: () {
                    _stopFile();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  color: Colors.white,
                  iconSize: 45,
                  onPressed: () {

                  },
                )
              ],
            ),
            SizedBox(height: 30,),
            Slider(
              activeColor: Colors.white,
              inactiveColor: Colors.pink,
              min: 0.0,
              max: _duration.inSeconds.toDouble(),
              value: _position.inSeconds.toDouble(),
              onChanged: (double value) {
                setState(() {
                  value = value;
                });
              },
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('${_position.inMinutes.toString()}:${_position.inSeconds.remainder(60).toString()}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0
                ),),
                Text('${_duration.inMinutes.toString()}:${_duration.inSeconds.remainder(60).toString()}',style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}




