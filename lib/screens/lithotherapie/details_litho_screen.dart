import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hygie/models/mineral.dart';

class DetailsLithoScreen extends StatelessWidget {

  final String category;

  DetailsLithoScreen({this.category});

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

  final mineral = Mineral.fromSnapshot(data);

  return Padding(
    key: ValueKey(mineral.name),
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
    child: Container(
      child: Column(
        children: <Widget>[
          Text(mineral.name),
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: mineral.image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          )
        ],
      ),
    ),
  );
}