
// http://monitorsibi.000webhostapp.com/RestFullApi/getData
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kamussibi/model/model_users.dart';
import 'package:kamussibi/ui/detail_list.dart';



class HomeScreen extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {

  List<Users> _ModelList = List<Users>();
  List<Users> _ModelListTampil = List<Users>();


  Future<List<Users>> fetchNotes() async {
    var url = 'http://monitorsibi.000webhostapp.com/RestFullApi/getData';
    var response = await http.get(url);

    var notes = List<Users>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        notes.add(Users.fromJson(noteJson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _ModelList.addAll(value);
        _ModelListTampil = _ModelList;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kamus Sibi'),
          backgroundColor: Colors.redAccent,
        ),
        body: ListView.builder(

          itemBuilder: (context, index) {
            return index == 0 ? _searchBar() : _listItem(index-1);
          },
          itemCount: _ModelList.length+1,
        )
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(

        decoration: InputDecoration(

            hintText: 'Search...'
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _ModelListTampil = _ModelList.where((note) {
              var noteTitle = note.kata.toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return InkWell(
      onTap: (){
            final nDataList = _ModelList[index];

      Navigator.push(context, MaterialPageRoute(
      builder: (_) => DetailListUser(nDataList)
      ));

      },

      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _ModelListTampil[index].kata,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black),
              ),

              Text(
                _ModelListTampil[index].contoh,
                style: TextStyle(
                    color: Colors.grey.shade600
                ),
              ),
            ],
          ),
        ),


      ),

    );

  }
}

