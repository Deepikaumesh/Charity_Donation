import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Order_Crafts_User extends StatefulWidget {
  @override
  _Order_Crafts_UserState createState() =>
      _Order_Crafts_UserState();
}

class _Order_Crafts_UserState
    extends State<Order_Crafts_User> {
  TextEditingController name = new TextEditingController();
  TextEditingController bank = new TextEditingController();
  TextEditingController ac_no = new TextEditingController();
  TextEditingController total_amt = new TextEditingController();

  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  late bool status;
  late String message;

  @override
  void initState() {
    name = TextEditingController();
    bank = TextEditingController();
    ac_no = TextEditingController();
    total_amt = TextEditingController();

    status = false;
    message = "";

    super.initState();
  }

  Future<void> submitData() async {
    var send = await http.post(
        Uri.parse(
            "http://192.168.29.64/MySampleApp/Charity_Hope/payment.php"),
        body: {
          "name": name.text,
          "bank": bank.text,
          "ac_no": ac_no.text,
          "total_amt": total_amt.text,
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
        bank.clear();
        ac_no.clear();
        total_amt.clear();

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
          "Payment",
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
                      controller: bank,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Date Should not empty!";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Enter bank name",
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
                      controller: ac_no,
                      validator: (value) {
                        if (value!.isEmpty || value!.length>10) {
                          return "Please enter  valid account number";
                        }
                        if (value.length <10) {
                          return "account number should be 10 digit";
                        }
                        return null;
                      },
                      onSaved: (phone) {},
                      decoration: InputDecoration(
                        labelText: "Enter account no",
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
                      controller: total_amt,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Description Should not empty!";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                      //  labelText: "Enter n",
                        label: Text("Total amount"),
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
                        name.clear();
                        bank.clear();
                        ac_no.clear();
                        total_amt.clear();
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
