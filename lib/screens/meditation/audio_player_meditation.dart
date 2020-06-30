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

  void seekToSecond(int second){
    Duration newDuration = Duration(seconds: second);

    advancedPlayer.seek(newDuration);
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
  void dispose() {
    _stopFile();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff324278),
        body: Column(
          children: <Widget>[
            Container(
              child: Image.asset(
                  musicBrain.getUrlImage(),
                   fit: BoxFit.fitHeight,
                   height: 400,
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 10.0,),
                Container(
                  child: Text(musicBrain.getAuthorMusic(),
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Rubik',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                    ),),
                ),
                SizedBox(height: 10.0,),
                Container(
                  child: Text(musicBrain.getTitleMusic(),
                    style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic
                    ),),
                ),
                SizedBox(height: 10.0,),
                Text(musicBrain.getListLength(), style: TextStyle(
                  color: Colors.grey[300]
                ),),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(trackHeight: 1.0, thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.0), overlayShape:
                  RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey[600],
                    min: 0.0,
                    max: _duration.inSeconds.toDouble(),
                    value: _position.inSeconds.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        seekToSecond(value.toInt());
                        value = value;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 100.0),
                      child: Text('${_position.inMinutes.toString()}:${_position.inSeconds.remainder(60).toString()}',
                        style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 15.0
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:100.0),
                      child: Text('${_duration.inMinutes.toString()}:${_duration.inSeconds.remainder(60).toString()}',style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 15.0
                      ),),
                    )
                  ],
                ),
                SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.skip_previous),
                      color: Colors.white,
                      iconSize: 45,
                      onPressed: () {
                        setState(() {
                          musicBrain.previousMusic();
                          _position = Duration();
                          _stopFile();
                        });
                      },
                    ),
                    play == true ? IconButton(
                        icon: Icon(Icons.play_circle_filled),
                        color: Colors.white,
                        iconSize: 45,
                        onPressed: () {
                          _playFile(musicBrain.getUrlMusic());
                        })
                        :
                    IconButton(
                      icon: Icon(Icons.pause_circle_filled),
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
                        setState(() {
                          musicBrain.nextMusic();
                          _position = Duration();
                          _stopFile();
                        });
                      },
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}






