import 'package:flutter/material.dart';
import 'package:whatsappbro/models/chat.dart';

class CallScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State {
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       itemCount: fakeData.length,
       itemBuilder: (context,i) =>Column(
         children: <Widget>[
           Divider(
             height: 10.0,
           ),
           ListTile(
             leading: CircleAvatar(
               backgroundImage: NetworkImage(fakeData[i].avatarUrl),
             ),
             title: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               
               children: <Widget>[
                
                 Text(fakeData[i].name, style: TextStyle(fontWeight: FontWeight.bold),),
                 Text(fakeData[i].time, style: TextStyle(fontSize: 14.0,color: Colors.grey)),
                 

               ],
              
             ),
             
            
             subtitle: Row(
               children: <Widget>[
                Icon(Icons.add_call),
              //padding: EdgeInsets.only(top: 5.0),              
               Text("Cevapsız Arama", style:  TextStyle(color: Colors.grey,fontSize: 15.0)),
                  

               ]
 
            
             ),             
           )
         ],
       ),
    );
  }
} 