import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hygie/components/category_card.dart';
import 'package:hygie/components/hamburger_menu.dart';
import 'package:hygie/screens/lithotherapie/lithotherapie_screen.dart';
import 'package:hygie/screens/meditation/audio_player_meditation.dart';
import 'package:hygie/screens/numerology/numerology_screen.dart';
import 'package:hygie/screens/phytotherapie/phytotherapie_screen.dart';
import 'package:hygie/screens/test/test_screen.dart';

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Color(0xFFF5CEB8),
      ),
      drawer: HamburgerMenu(),
      body: Stack(
        children: <Widget>[
           Container(
               height: size.height * .45,
               decoration: BoxDecoration(
                 color: Color(0xFFF5CEB8),
                 image: DecorationImage(
                     alignment: Alignment.centerLeft,
                     image: AssetImage("assets/images/undraw_pilates_gpdb.png"
                     )
                 )
               ),
           ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          CategoryCard(
                            title: "Phytothérapie",
                            svgSrc: "assets/icons/phyto.svg",
                            press: ()
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PhytotherapieScreen();
                                  }
                                )
                              );
                            },
                          ),
                          CategoryCard(
                            title: "Lithothérapie",
                            svgSrc: "assets/icons/crystal.svg",
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) {
                                        return LithotherapieScreen();
                                      }
                                  )
                              );
                            },
                          ),
                          CategoryCard(
                            title: "Numérologie",
                            svgSrc: "assets/icons/numerology.svg",
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) {
                                        return NumerologyScreen();
                                      }
                                  )
                              );
                            },
                          ),
                          CategoryCard(
                            title: "Oracle",
                            svgSrc: 'assets/icons/oracle.svg',
                            press: () {},
                          ),
                          CategoryCard(
                            title: "Méditation",
                            svgSrc: "assets/icons/meditation.svg",
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AudioPlayerNavigation();
                                  }
                                )
                              );
                            },
                          ),
                          CategoryCard(
                            title: "Test",
                            svgSrc: "assets/icons/test.svg",
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) {
                                        return TestScreen();
                                      }
                                  )
                              );
                            },
                          )
                        ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




