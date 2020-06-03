import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hygie/components/search.dart';
import 'package:hygie/components/category_card.dart';
import 'package:hygie/screens/details_screen.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text(
                      "Bienvenue Sur \nHygie",
                      style: TextStyle(
                          fontFamily: "Rubik",
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          CategoryCard(
                            title: "Phytothérapie",
                            svgSrc: "assets/icons/hamburger.svg",
                            press: () {},
                          ),
                          CategoryCard(
                            title: "Kegel Exercises",
                            svgSrc: "assets/icons/exercices.svg",
                            press: () {},
                          ),
                          CategoryCard(
                            title: "Meditation",
                            svgSrc: "assets/icons/meditation.svg",
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return DetailsScreen();
                                }),
                              );
                            },
                          ),
                          CategoryCard(
                            title: "Yoga",
                            svgSrc: "assets/icons/yoga.svg",
                            press: () {},
                          ),
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


