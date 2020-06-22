import 'package:cloud_firestore/cloud_firestore.dart';

class Plant {
  final String name;
  final String image;
  final String usage_interne;
  final String decoction;
  final String teinture_mere;
  final String huile;
  final DocumentReference reference;

  Plant.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['image'] != null),
        assert(map['usage_interne'] != null),
        assert(map['decoction'] != null),
        assert(map['teinture_mere'] != null),
        assert(map['huile'] != null),
        name = map['name'],
        usage_interne = map['usage_interne'],
        decoction = map['decoction'],
        teinture_mere = map['teinture_mere'],
        huile = map['huile'],
        image = map['image'];


  Plant.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$usage_interne:$teinture_mere:$decoction:$image:$huile>";
}