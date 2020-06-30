import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hygie/models/test_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

TestBrain testBrain = new TestBrain();

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  bool boolean = false;

  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: true,
    isOverlayTapDismiss: true,
    descStyle: TextStyle(fontWeight: FontWeight.w300),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold
    ),
  );

  @override
  void dispose() {
    testBrain.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('ELIXIRS DE CRISTAUX',
            style:
            TextStyle(fontFamily: 'Tillana', fontWeight: FontWeight.w400),),
          elevation: 0,
          backgroundColor:  Color.fromARGB(255, 158,187,141),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(testBrain.getAnswer(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Tillana',
                      color: Colors.black,
                      fontSize: 25
                  ),)
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      elevation: 5,
                      color: Colors.green,
                      onPressed: () {
                        setState(() {
                          boolean = true;
                        });
                      },
                      padding: EdgeInsets.all(15.0),
                      child: Text('Vrai',
                        style:
                        TextStyle(color: Colors.white),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      elevation: 5,
                      color: Colors.redAccent,
                      onPressed: () {
                        setState(() {
                          testBrain.nextAnswer();
                          boolean = false;
                        });
                      },
                      padding: EdgeInsets.all(15.0),
                      child: Text('Faux',
                        style: TextStyle(
                            color: Colors.white ),),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(trackHeight: 1.0, thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.0), overlayShape:
                RoundSliderOverlayShape(overlayRadius: 30.0)),
                child: Slider(
                  inactiveColor: Colors.greenAccent,
                  activeColor: Colors.lightGreen,
                  value: testBrain.getTestNumber().toDouble(),
                  onChanged: (double value) {
                    value = value;
                  },
                  max: testBrain.getAnswerLength().toDouble(),
                  min: 0.0,
                ),
              ),
              Text(
                  '${testBrain.getTestNumber()}/${testBrain.getAnswerLength()}',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40,),
              boolean ? FlatButton(
                onPressed: (){
                  Alert(
                      buttons: [
                        DialogButton(
                          onPressed: () => null, child: null,color: Colors.white,
                        )
                      ],
                      context: context,
                      style: alertStyle,
                      image: Image.asset(testBrain.getImageUrl()),
                      title: testBrain.getProductAssociated(),
                      desc: testBrain.getDescription()).show();
                },
                child: Text(testBrain.getProductAssociated(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Tillana',
                      color: Colors.black,
                      fontSize: 25
                  ),),
              ) : Text(''),
              SizedBox(height: 50,),
              boolean ? FlatButton(
                  onPressed: () {
                    setState(() {
                      testBrain.nextAnswer();
                      boolean = false;
                    });
                  },
                  child: Text('Suivant')
              ) : Text(''),
            ],
          ),
        )
      ),
    );
  }
}

