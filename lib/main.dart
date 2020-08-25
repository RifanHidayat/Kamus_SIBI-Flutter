

import 'package:flutter/material.dart';
import 'package:kamussibi/ui/Home.dart';
import 'package:kamussibi/ui/Splasscreen.dart';



void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIBI',
      color: Colors.redAccent,
      debugShowCheckedModeBanner: false,
      home:SplassScreen(),
    );
  }
}