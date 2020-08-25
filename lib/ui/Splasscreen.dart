import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kamussibi/ui/Home.dart';
class SplassScreen extends StatefulWidget {
  @override
  _SplassScreenState createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> {
  void initState(){
    startTimer();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.red[300]),

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: Icon(
                          Icons.library_books,
                          color: Colors.blue[200],
                          size: 50,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),

                      ),
                      Text(
                        "Kamus SIBI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,

                        ),
                      )
                    ],
                  ),

                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(

                      backgroundColor: Colors.red[250],

                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Text("Sistem Isyarat Bahasa Indonesia",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),


                    )
                  ],
                ),
              )

            ],
          )
        ],

      ),


    );
  }
  Future<Timer> startTimer() async {
    return Timer(Duration(seconds: 3), onDone);
  }
  void onDone() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>HomeScreen()
    ));
  }

}
