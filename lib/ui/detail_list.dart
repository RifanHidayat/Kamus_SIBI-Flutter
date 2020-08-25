
import 'package:flutter/material.dart';
import 'package:kamussibi/model/model_users.dart';
class DetailListUser extends StatelessWidget {
  final Users user;
  DetailListUser(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        title: Text(user.kata),
    backgroundColor: Colors.redAccent,
    ),
    body: Padding(
    padding: const EdgeInsets.only(top: 40,left: 10),
    child: Center(
    child: Column(
    children: <Widget>[
    Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    Image.network(
    user.url,
      width: 200,
      height: 200,

    ),
     Container(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           SizedBox(height: 10,),
           Text("Deskripsi",
             style: TextStyle(fontWeight: FontWeight.bold,
                 fontSize: 18,
                 color: Colors.black

             ),
           ),
           Text(user.deskripsi),
           SizedBox(
             height: 5.0,
           ),
           Text("Contoh",
             style: TextStyle(fontWeight: FontWeight.bold,
                 fontSize: 18,
                 color: Colors.black

             ),
           ),
           Text(user.contoh),
         ],
       ),

       ),

    ],
    ),
    ],
    ),
    ),
    ),
    );
  }
}