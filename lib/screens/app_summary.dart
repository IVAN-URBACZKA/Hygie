import 'package:flutter/material.dart';

class AppSummary extends StatefulWidget {

  static const String id = "appsummary";
  final String uid;
  AppSummary(this.uid);


  @override
  _AppSummaryState createState() => _AppSummaryState();
}

class _AppSummaryState extends State<AppSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
