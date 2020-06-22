import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class NumberResults extends StatefulWidget {

  final int number;

  NumberResults({this.number});

  @override
  _NumberResultsState createState() => _NumberResultsState();
}




class _NumberResultsState extends State<NumberResults> {

  String description;
  final _firestore = Firestore.instance;
  bool isLoading = true;

  @override
  void initState() {
    getNumber(widget.number);
    isLoading = false;
    super.initState();
  }


  void getNumber(int num) async{
     await _firestore.collection('numerology').where("number",isEqualTo: num).getDocuments().then((value){
      value.documents.forEach((result){
         description = result.data['description'];
         setState(() {
           description;
         });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 5),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xffad74af),
                  border: Border.all(color: Color(0xffad74af)),
                  borderRadius: BorderRadius.circular(50.0)
                ),
                child: Hero(
                  tag: 'tag',
                  child: Text('${widget.number}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Tillana',
                      fontWeight: FontWeight.bold
                    ),),
                ),
              ),
              SizedBox(height: 5,),
              description == null ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ) :
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('$description',
                  style: TextStyle(
                    color: Color(0xffad74af),
                    fontFamily: "Rubik",
                    fontSize: 17,
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

