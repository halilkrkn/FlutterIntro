import 'package:cloud_firestore/cloud_firestore.dart';

class Anket {

  String isim;
  int oy;
  DocumentReference reference;

  Anket.fromMap(Map<String,dynamic> map,{this.reference})
        :assert(map["isim"] != null),
         assert(map["oy"] != null),
        isim= map["isim"],
        oy = map["oy"]; 


  //Anketin datasını ve reference sini Anket.fromMap e atadık.
  Anket.fromSnapShot(DocumentSnapshot snapshot)
  :this.fromMap(snapshot.data, reference: snapshot.reference);


  @override
  String toString()=>"Kayıt<$isim : $oy>";
  
}