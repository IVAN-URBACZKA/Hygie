import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hygie/screens/numerology/number_results.dart';

class NumerologyScreen extends StatefulWidget {
  @override
  _NumerologyScreenState createState() => _NumerologyScreenState();
}

class _NumerologyScreenState extends State<NumerologyScreen> {


  int birthDate(DateTime dateTime){

    int number = 0;
    int numbersup = 0;
    int numberThird = 0;

    String year = dateTime.year.toString();
    String month = dateTime.month.toString();
    String day = dateTime.day.toString();
    List<String> dateBirth = "$year$month$day".split("");

    for(int i = 0; i < dateBirth.length; i++){

         if(int.parse(dateBirth[i]) is int){
            number += int.parse(dateBirth[i]);
         }


    }

    if(number<10){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) {
                return NumberResults(number: number);
              }
          )
      );
    }
    else{
      List<String> secondList = number.toString().split('');
      for(int i = 0; i < secondList.length; i++){
        numbersup += int.parse(secondList[i]);
      }
      if(numbersup <= 9)
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) {
                    return NumberResults(number: numbersup);
                  }
              )
          );
        }
      else{
        List<String> thirdList = numbersup.toString().split('');
        for(int i = 0; i < thirdList.length;i++)
          {
              numberThird += int.parse(thirdList[i]);
          }
        if(numberThird <= 9)
        {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) {
                    return NumberResults(number: numberThird);
                  }
              )
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Votre Chemin De Vie'),
        backgroundColor: Color(0xffad74af),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Cliquez sur votre calendrier',
                style: TextStyle(
                    color: Color(0xffad74af),
                    fontSize: 22
                )),
        SizedBox(height: 20,),
        Hero(
          child: Center(
            child: FlatButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1950, 12, 31),
                      maxTime: DateTime(2020, 12, 31), onConfirm: (date) {
                         birthDate(date);
                      }, currentTime: DateTime.now(), locale: LocaleType.fr);
                },
                child: Icon(
                    Icons.calendar_today,
                    color: Color(0xffad74af),
                    size: 50,
                )),
          ), tag: 'tag',
        ),
          ],
        ),
      ),
    );
  }
}
