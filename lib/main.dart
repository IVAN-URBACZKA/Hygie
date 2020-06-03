import 'package:flutter/material.dart';
import 'package:hygie/screens/app_summary.dart';
import 'package:hygie/screens/home_screen.dart';
import 'package:hygie/screens/login.dart';
import 'package:hygie/screens/register.dart';
import 'package:hygie/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        Login.id: (context) => Login(),
        Register.id: (context) => Register(),

      },
    );
  }
}

