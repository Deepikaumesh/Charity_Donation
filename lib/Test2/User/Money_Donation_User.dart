import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class Hope_User_Money_Donation extends StatefulWidget {
  @override
  _Hope_User_Money_DonationState createState() =>
      _Hope_User_Money_DonationState();
}

class _Hope_User_Money_DonationState
    extends State<Hope_User_Money_Donation> {
  TextEditingController name = new TextEditingController();
  TextEditingController place = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController amount = new TextEditingController();
  TextEditingController bank = new TextEditingController();
  TextEditingController account = new TextEditingController();

  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  late bool status;
  late String message;

  @override
  void initState() {
    name = TextEditingController();
    place = TextEditingController();
    phone = TextEditingController();
    amount = TextEditingController();
    bank = TextEditingController();
     account= TextEditingController();

    status = false;
    message = "";

    super.initState();
  }

  Future<void> submitData() async {
    var send = await http.post(
        Uri.parse(
            "http://$ip/MySampleApp/Charity_Hope/user_money_donation.php"),
        body: {
          "name": name.text,
          "place": place.text,
          "phone": phone.text,
          "amount": amount.text,
          "bank": bank.text,
          "account": account.text,
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
        place.clear();
        phone.clear();
        amount.clear();
        bank.clear();
        account.clear();

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
          "Money Donation",
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
                      controller: name,
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
                      controller: place,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Date Should not empty!";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Place",
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
                      controller: phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Time Should not empty!";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "phone number",
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    //  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: TextFormField(
                      controller: amount,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Description Should not empty!";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "amount",
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      //maxLines: 5,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    //  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: TextFormField(
                      controller: bank,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Description Should not empty!";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Bank name",
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      //maxLines: 5,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    //  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: TextFormField(
                      controller: account,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Description Should not empty!";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "account number",
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      //maxLines: 5,
                    ),
                  ),
                  SizedBox(height: 30,),
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
                        place.clear();
                        phone.clear();
                        amount.clear();
                        bank.clear();
                        account.clear();
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
