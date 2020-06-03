import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hygie/screens/app_summary.dart';
import 'package:hygie/screens/register.dart';
import 'package:hygie/services/auth.dart';
import 'package:hygie/screens/login.dart';

class HomeScreen extends StatefulWidget {

  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: Stack(
         fit: StackFit.expand,
         children: <Widget>[
           SafeArea(
             child: Padding(
               padding: EdgeInsets.all(32.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 mainAxisSize: MainAxisSize.max,
                 children: <Widget>[
                   Text('Hygie', style: TextStyle(
                       color: Color(0xff03DA9D),
                       fontFamily: "Rubik",
                       fontWeight: FontWeight.bold,
                       fontSize: 25
                   )),
                   Text('Votre application santé ',
                   style: TextStyle(
                     color: Color(0xff03DA9D),
                     fontFamily: "Rubik",
                     fontSize: 20,
                       fontWeight: FontWeight.w500
                   )),
                   SizedBox(height: 100),
                   Image(image: AssetImage('assets/images/welcome.jpg')),
                   Expanded(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       crossAxisAlignment: CrossAxisAlignment.stretch,
                       children: <Widget>[
                         SignInButton(
                           Buttons.Google,
                           onPressed: () async {
                             final user = await Auth.googleSignIn();
                             if(user != null){
                               Navigator.pushAndRemoveUntil(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) => AppSummary(user)),
                                   ModalRoute.withName("/"));
                             }
                           },
                         ),
                         Row(
                           children: <Widget>[
                             Expanded(child: Divider()),
                             Padding(
                               padding: EdgeInsets.all(8.0),
                               child: Text('OR'),
                             ),
                             Expanded(child: Divider()),
                           ]),
                         RaisedButton(
                            child: Text("Créer un compte", style: TextStyle(color: Colors.white)),
                            color: Color(0xff03DA9D),
                            onPressed: (){
                              Navigator.pushNamed(context, Register.id);
                            },
                         ),
                         FlatButton(
                           child: Text(
                               "Sign In",
                           ),
                           onPressed: (){
                             Navigator.pushNamed(context, Login.id);
                           },
                         )
                       ],
                     ),
                   ),
                 ],
               ),
             ),
           )
         ],
       ),
    );
  }
}

