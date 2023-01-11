import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

import '../User/Display_Craf_User_.dart';

class User_View_craft_shop_Detail_Page extends StatefulWidget {
  final craft_model data_craft;

  const User_View_craft_shop_Detail_Page({required this.data_craft});

  @override
  _User_View_craft_shop_Detail_PageState createState() =>
      _User_View_craft_shop_Detail_PageState();
}

class _User_View_craft_shop_Detail_PageState
    extends State<User_View_craft_shop_Detail_Page> {
  TextEditingController crt_id = new TextEditingController();
  TextEditingController uid = new TextEditingController();
  late bool status;
  late String message;

  @override
  void initState() {
    crt_id = TextEditingController(text: widget.data_craft.craft_id);
    uid = TextEditingController();

    status = false;
    message = "";

    super.initState();
  }

  Future<void> submitData() async {
    var send = await http.post(
        Uri.parse(
            "http://192.168.29.64/MySampleApp/Charity_Hope/user_add_to_cart.php"),
        body: {
          //"id": widget.data_craft.id.toString(),
          "craft_id": widget.data_craft.craft_id,
          "uid": uid.text,
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
        crt_id.clear();
        uid.clear();
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
      body: Stack(
        children: [
          Positioned(
            top: 30,
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue.shade100,
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 50,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                  //border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow,
                  image: DecorationImage(
                      image: NetworkImage(widget.data_craft.image),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: 60,
            right: 40,
            left: 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 9.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: crt_id,
                decoration: InputDecoration(
                  labelText: "craft id",
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 40,
            left: 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 9.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: uid,
                decoration: InputDecoration(
                  labelText: "uid",
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal),
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          // Positioned(
          //   top: 130,
          //   right: 40,
          //   left: 40,
          //   child:Text("hello"+uid_user),
          // ),
          Positioned(
            top: 400,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(20),
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.data_craft.name,
                          style: GoogleFonts.prompt(
                              color: Colors.white, fontSize: 20)),
                      Text("\$" + widget.data_craft.price,
                          style: GoogleFonts.prompt(
                              color: Colors.white, fontSize: 20)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.data_craft.description,
                    style: (TextStyle(fontSize: 15)),
                    // style: GoogleFonts.bokor(
                    //     color: Colors.blueGrey, fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 700,
            right: 40,
            left: 40,
            child: Container(
              height: 80,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.pink.shade300,
                  padding:
                      EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15),
                ),
                onPressed: () {
                  setState(() {});
                  submitData();
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          // title: Text("Add to cart"),
                          content: Text("craft added successfully"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("ok")),
                            // TextButton(
                            //     onPressed: () {
                            //       Navigator.pop(context);
                            //     },
                            //     child: Text("cancel")),
                          ],
                        );
                      });
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => submitData()));
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
