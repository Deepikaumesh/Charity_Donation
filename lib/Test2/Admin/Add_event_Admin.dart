import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class Hope_Admin_event_registration extends StatefulWidget {
  @override
  _Hope_Admin_event_registrationState createState() =>
      _Hope_Admin_event_registrationState();
}

class _Hope_Admin_event_registrationState
    extends State<Hope_Admin_event_registration> {
  TextEditingController name = new TextEditingController();
  TextEditingController event_date = new TextEditingController();
  TextEditingController event_time = new TextEditingController();
  TextEditingController description = new TextEditingController();

  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  late bool status;
  late String message;

  @override
  void initState() {
    name = TextEditingController();
    event_date = TextEditingController();
    event_time = TextEditingController();
    description = TextEditingController();

    status = false;
    message = "";

    super.initState();
  }

  Future<void> submitData() async {
    var send = await http.post(
        Uri.parse(
            "http://$ip/MySampleApp/Charity_Hope/event_registration.php"),
        body: {
          "name": name.text,
          "event_date": event_date.text,
          "event_time": event_time.text,
          "description": description.text,
        });

    if (send.statusCode == 200) {
      var data = json.decode(send.body);
      var responseMessage = data["message"];
      var responseError = data["error"];
      if (responseError) {
        setState(() {
          status = false;
          message = responseMessage;
        });
      } else {
        name.clear();
        event_date.clear();
        event_time.clear();
        description.clear();

        setState(() {
          status = true;
          message = responseMessage;
        });
      }
    } else {
      setState(() {
        message = "Error:Server error";
        status = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add Event",
          style: GoogleFonts.prompt(color: Colors.pink.shade300),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded, color: Colors.pink.shade300,
            size: 35, // add custom icons also
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name Should not empty!";
                        }

                        return null;
                      },
                      controller: name,
                      decoration: InputDecoration(
                        labelText: "Enter event name",
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: TextFormField(
                      controller: event_date,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Date Should not empty!";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Pick event date",
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal),
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    //  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: TextFormField(
                      controller: event_time,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Time Should not empty!";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Enter event time",
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    //  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: TextFormField(
                      controller: description,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Description Should not empty!";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Enter event description",
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.pink.shade200,
                      padding: EdgeInsets.only(
                          left: 110, right: 110, top: 20, bottom: 20),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          submitData();
                        });
                        name.clear();
                        event_time.clear();
                        event_date.clear();
                        description.clear();
                      }
                    },
                    child: Text('Submit'),
                  ),
                  SizedBox(height: 15,),
                  Text(status ? message : message,style: GoogleFonts.adamina(),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
