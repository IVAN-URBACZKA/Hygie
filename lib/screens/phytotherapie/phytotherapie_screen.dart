import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hygie/screens/phytotherapie/details_phyto_screen.dart';

class PhytotherapieScreen extends StatefulWidget {
  @override
  _PhytotherapieScreenState createState() => _PhytotherapieScreenState();
}

class _PhytotherapieScreenState extends State<PhytotherapieScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
         body: ListView(
           children: <Widget>[
             Card(
               child: ListTile(
                  leading: Image.asset('assets/icons/visage.png'),
                  title: Text('Acné'),
                  subtitle: Text('Lutter contre les problèmes de peau'),
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(
                       builder: (context) => DetailsPhytoScreen(category: 'acne')
                    ));
                  },
               ),
             ),
             Card(
               child: ListTile(
                 leading: Image.asset('assets/icons/digestion.png'),
                 title: Text('Digestion'),
                 subtitle: Text('Pour une meilleure digestion'),
                 onTap: (){
                   Navigator.push(context,MaterialPageRoute(
                       builder: (context) => DetailsPhytoScreen(category: 'acne')
                   ));
                 },
               ),
             ),
             Card(
               child: ListTile(
                 leading: Image.asset('assets/icons/zen.png'),
                 title: Text('Stress'),
                 subtitle: Text('Apaiser les tensions'),
                 onTap: (){
                   Navigator.push(context,MaterialPageRoute(
                       builder: (context) => DetailsPhytoScreen(category: 'acne')
                   ));
                 },
               ),
             )
           ],
         ),
      ),
    );
  }
}
