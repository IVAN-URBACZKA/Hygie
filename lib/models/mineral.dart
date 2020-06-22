import 'package:cloud_firestore/cloud_firestore.dart';

class Mineral{
  final String name;
  final String image;
  final DocumentReference reference;

  Mineral.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['image'] != null),
        name = map['name'],
        image = map['image'];


  Mineral.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$image>";
}