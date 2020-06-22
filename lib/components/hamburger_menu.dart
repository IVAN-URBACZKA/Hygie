import 'package:flutter/material.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
            ),
            child: Text(
              'Hygie',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Calendrier'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Paramètres'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Boutique'),
          ),
          ListTile(
            leading: Icon(Icons.note_add),
            title: Text("Evaluer l'application"),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Politique de Confidentialité'),
          ),
        ],
      ),
    );
  }
}