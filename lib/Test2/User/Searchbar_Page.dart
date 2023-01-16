import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class Searchbar_Page extends StatefulWidget {
  const Searchbar_Page({Key? key}) : super(key: key);

  @override
  _Searchbar_PageState createState() => _Searchbar_PageState();
}

class _Searchbar_PageState extends State<Searchbar_Page> {
  List<Note> _notes = [];
  List<Note> _notesForDisplay = [];

  Future<List<Note>> fetchNotes() async {
    var url =
        "http://$ip/MySampleApp/Charity_Hope/Display_all_data.php";
    var response = await http.get(Uri.parse(url));

    List<Note> notes = [];

    if (response.statusCode == 200) {
      var notesjson = json.decode(response.body);
      for (var notejson in notesjson) {
        notes.add(Note.fromJson(notejson));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
        _notesForDisplay = _notes;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:
          Text(
            "Search food donations",
            style: GoogleFonts.prompt(color: Colors.pink.shade300),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          // leading: GestureDetector(
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          //   child: Icon(
          //     Icons.arrow_back_rounded,
          //     color: Colors.red.shade900,
          //     size: 30,
          //   ),
          // ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return index == 0 ? _searchBar() : _listitem(index - 1);
          },
          itemCount: _notesForDisplay.length + 1,
        ));
  }

  _searchBar() {
    return Padding(
      padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
      child: TextField(
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: new InputDecoration(
          border: new OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.circular(40),
          ),
          hintText: 'Search food....',
        //  icon: Icon(Icons.search),
        ),
        // decoration: InputDecoration(
        //     prefixIcon:Icon(Icons.search),
        //     hintText: 'Search Catagory....',
        //   border: InputBorder.none,
        // ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _notesForDisplay = _notes.where((note) {
              var food = note.food.toLowerCase();
              return food.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listitem(index) {
    return Card(
      elevation: 5,
      color: Colors.grey.shade200,
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          leading:Text(
            _notesForDisplay[index].food+":->",
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lora(
                fontSize: 15,
                color: Colors.orange.shade900,
                fontWeight: FontWeight.bold),
          ),
          // leading:
          // Container(
          //   height: 50,
          //   width: 50,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     border: Border.all(color: Colors.red.shade900),
          //     image: DecorationImage(
          //       image: NetworkImage(_notesForDisplay[index].image),
          //     ),
          //   ),
          // ),
          title: Text(
            _notesForDisplay[index].donor,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lora(
                fontSize: 15,
                color: Colors.pink.shade700,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            _notesForDisplay[index].date,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.lora(
                fontSize: 10,
                color: Colors.pink.shade700,
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) {
            //       return Vie_More_Detail(_notesForDisplay[index]);
            //     }
            //     )
          }),
    );
  }
}

List<Note> userModelFromJson(String str) =>
    List<Note>.from(json.decode(str).map((x) => Note.fromJson(x)));

String userModelToJson(List<Note> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Note {
  Note({
    required this.donor,
    required this.date,
    required this.food,

  });

  String donor;
  String date;
  String food;


  factory Note.fromJson(Map<String, dynamic> json) => Note(
    donor: json["donor"],
    date: json["date"],
    food: json["food"],

      );

  Map<String, dynamic> toJson() => {
        "donor": donor,
        "date": date,
        "food": food,

      };
}
