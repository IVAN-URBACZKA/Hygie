import 'music.dart';

class MusicBrain{

  int _musicNumber = 0;

  List<Music> _musicBank = [

    Music(authorMusic: 'Morgane Cucak', titleMusic: "Méditation", urlMusic: 'music/meditation.mp3')


  ];

  String getAuthorMusic(){
    return _musicBank[_musicNumber].authorMusic;
  }

  String getTitleMusic(){
    return _musicBank[_musicNumber].titleMusic;
  }

  String getUrlMusic(){
    return _musicBank[_musicNumber].urlMusic;
  }

}