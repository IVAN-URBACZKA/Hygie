import 'package:hygie/components/answer.dart';

class TestBrain {

  int _testNumber = 0;

  List<Answer> _answerBank = [

    Answer(answerText: 'test', productAssociated: 'test', description: 'test', imageUrl: ''),
    Answer(answerText: 'test', productAssociated: 'test', description: 'test', imageUrl: ''),
    Answer(answerText: 'test', productAssociated: 'test', description: 'test', imageUrl: ''),
    Answer(answerText: 'test', productAssociated: 'test', description: 'test', imageUrl: ''),


  ];

  String getAnswer() {
    return _answerBank[_testNumber].description;
  }

  String getDescription() {
    return _answerBank[_testNumber].description;
  }

  String getImageUrl () {
    return _answerBank[_testNumber].imageUrl;
  }

  int getAnswerLength() {
    return _answerBank.length;
  }

  String getProductAssociated() {
    return _answerBank[_testNumber].productAssociated;
  }

  int getTestNumber(){
    return _testNumber;
  }

  void nextAnswer() {
    if(_testNumber < _answerBank.length - 1){
       _testNumber++;
    }
  }

  void reset() {
    _testNumber =0;
  }

}