import 'package:anket_firebase/main.dart';
import 'package:anket_firebase/models/anket.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AnketList extends StatefulWidget {

  @override
  _AnketListState createState() => _AnketListState();
}

class _AnketListState extends State<AnketList> {
  @override
  Widget build(BuildContext context) => StreamBuilder<QuerySnapshot>(

      stream: Firestore.instance.collection("anket").snapshots(),
      builder:(context,snapshot){
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        }else{
           return _buildBody(context,snapshot.data.documents);
        }
      },

    );
    
       _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
         return ListView(
           padding: EdgeInsets.only(top: 20.0),
           children: snapshot.map<Widget>((data) => _buildListItem(context,data)).toList());           
                  } 
           
             _buildListItem(BuildContext context, DocumentSnapshot data) {

               final kayit = Anket.fromSnapShot(data);
               return Padding(
                 key: ValueKey(kayit.isim),
                 padding:EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0) ,
                 child: Container(
                   decoration: BoxDecoration(
                     border:Border.all(color: Colors.grey),
                     borderRadius: BorderRadius.circular(5.0)
                   ),
                   child: ListTile(
                     title: Text(kayit.isim),
                     trailing: Text(kayit.oy.toString()),
                     onTap: ()=>Firestore.instance.runTransaction((transaction) async {
                        final freshSnapshot = await transaction.get(kayit.reference); // veri tabanında ki data
                        final fresh = Anket.fromSnapShot(freshSnapshot);// Anket
                        await transaction.update(kayit.reference, {'oy': fresh.oy+1});
                     })

                   ),
                 ),
               );
                
               

             }
}




