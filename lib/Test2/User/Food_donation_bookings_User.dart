import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import 'package:intl/intl.dart';

class Hope_User_food_donation_bookings extends StatefulWidget {
  @override
  _Hope_User_food_donation_bookingsState createState() =>
      _Hope_User_food_donation_bookingsState();
}

class _Hope_User_food_donation_bookingsState
    extends State<Hope_User_food_donation_bookings> {
  TextEditingController date = new TextEditingController();
  TextEditingController donor = new TextEditingController();
  TextEditingController food = new TextEditingController();
  TextEditingController uid = new TextEditingController();


  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  late bool status;
  late String message;

  @override
  void initState() {
    date = TextEditingController();
    donor = TextEditingController();
    food = TextEditingController();
    uid = TextEditingController();



    status = false;
    message = "";

    super.initState();
  }

  Future<void> submitData() async {

    var send = await http.post(
        Uri.parse(
            "http://$ip/MySampleApp/Charity_Hope/user_food_donation_bookings.php"),
        body: {
          "date": date.text,
          "food": food.text,
          "donor": donor.text,
          "uid":uid_user,
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
        date.clear();
        food.clear();
        donor.clear();

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
          "Food donation",
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name Should not empty!";
                        }

                        return null;
                      },
                      controller: donor,
                      decoration: InputDecoration(
                        labelText: "Enter your name",
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
                      onTap: ()async{
                        DateTime? pickeddate= await showDatePicker
                          (context: context,
                            initialDate: DateTime.now(),
                            firstDate:DateTime(2000),
                            lastDate: DateTime(2101));
                        if(pickeddate !=null){
                          setState(() {
                            date.text =DateFormat('yyyy-MM-dd').format(pickeddate);

                          });
                        }
                      },

                      controller: date,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Date Should not empty!";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today_rounded),
                        labelText: "Pick date",
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
                      textCapitalization: TextCapitalization.words,
                      controller: food,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Time Should not empty!";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Enter food type",
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
                        donor.clear();
                        food.clear();
                        date.clear();
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
