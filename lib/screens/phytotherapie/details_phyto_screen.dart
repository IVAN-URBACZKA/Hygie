import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hygie/models/plant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailsPhytoScreen extends StatelessWidget {

  final String category;

  DetailsPhytoScreen({this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream:  Firestore.instance.collection(category).snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData) return LinearProgressIndicator(backgroundColor: Colors.red);
          return _buildList(context,snapshot.data.documents);
        },
      ),
    );
  }

}

Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    padding: const EdgeInsets.only(top: 20.0),
    children: snapshot.map((data) => _buildListItem(context, data)).toList(),
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
  final plant = Plant.fromSnapshot(data);

  return Padding(
    key: ValueKey(plant.name),
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
    child: Container(
      child: Column(
        children: <Widget>[
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: plant.image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 10.0,),
          Text(plant.name, style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 10.0,),
          Text('Utilisations',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline)
            ),
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 0,bottom: 5.0,top: 10.0),
                child: Text('Usage Interne:', style: TextStyle(fontWeight: FontWeight.w500,decoration: TextDecoration.underline),)
              ),
              SizedBox(height: 10.0),
            ],
          ),
          Column(
            children: <Widget>[
              Text(plant.usage_interne)
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 0,bottom: 5.0,top: 10.0),
                  child: Text('En Décoction:', style: TextStyle(fontWeight: FontWeight.w500,decoration: TextDecoration.underline),)
              ),
              SizedBox(height: 10.0),
            ],
          ),
          Column(
            children: <Widget>[
              Text(plant.decoction)
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 0,bottom: 5.0,top: 10.0),
                  child: Text('Huile:', style: TextStyle(fontWeight: FontWeight.w500,decoration: TextDecoration.underline),)
              ),
              SizedBox(height: 10.0),
            ],
          ),
          Column(
            children: <Widget>[
              Text(plant.huile)
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 0,bottom: 5.0,top: 10.0),
                  child: Text('En Teinture mère:', style: TextStyle(fontWeight: FontWeight.w500,decoration: TextDecoration.underline),)
              ),
              SizedBox(height: 10.0),
            ],
          ),
          Column(
            children: <Widget>[
              Text(plant.teinture_mere)
            ],
          ),
          Divider(
            color: Colors.green,
            height: 20,
            thickness: 2,
            indent: 2,
            endIndent: 0,
          ),
        ],
      ),
    ),
  );
}