import 'music.dart';

class MusicBrain{

  int _musicNumber = 0;

  List<Music> _musicBank = [

    Music(authorMusic: 'Three masters', titleMusic: "Nature weather", urlMusic: 'music/meditation.mp3',urlImage: 'assets/images/test.jpg'),
    Music(authorMusic: 'Jazzy man', titleMusic: "Piano song", urlMusic: 'music/Darin_Wilson_-_One_For_Bill.mp3', urlImage: 'assets/images/welcome.jpg')

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

  String getUrlImage(){
    return _musicBank[_musicNumber].urlImage;
  }

  String getListLength(){
    return '${_musicNumber+1}/${_musicBank.length}';
  }

  void nextMusic() {
    if (_musicNumber < _musicBank.length - 1) {
      _musicNumber++;
    }
  }

  void previousMusic() {
    if(_musicNumber != 0){
      _musicNumber--;
    }
  }



}