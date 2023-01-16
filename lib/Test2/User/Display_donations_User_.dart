import 'dart:convert';
import 'package:chari/Test2/Admin/View_donation_detail_page_Admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import 'Money_Donation_User.dart';
import 'Money_Donation_detail_page_User.dart';

//Creating a class user to store the data;
class donation_model {
  final String id;
  final String name;
  final String place;
  final String phone;
  final String amount;

  donation_model({
    required this.id,
    required this.name,
    required this.place,
    required this.phone,
    required this.amount,
  });
}

class Usre_donation_Display extends StatefulWidget {
  @override
  _Usre_donation_DisplayState createState() => _Usre_donation_DisplayState();
}

class _Usre_donation_DisplayState extends State<Usre_donation_Display> {
  //Applying get request.
  Future<List<donation_model>> getRequest() async {
    //replace your restFull API here.

    final response = await http.get(Uri.parse(
        "http://$ip/MySampleApp/Charity_Hope/donation_display.php"));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<donation_model> users = [];
    for (var singleUser in responseData) {
      donation_model user = donation_model(
        // productqty: singleUser["productqty"].toString(),

        name: singleUser["name"].toString(),
        id: singleUser["id"].toString(),
        place: singleUser["place"].toString(),
        phone: singleUser["phone"].toString(),
        amount: singleUser["amount"].toString(),
      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.pink.shade300,
        centerTitle: true,
        title: Text(
          "Donations",
          style: GoogleFonts.prompt(fontSize: 22),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder(
              future: getRequest(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                if (snapshot.data == null || snapshot.data == false) {
                  return Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.red.shade900,
                            strokeWidth: 5,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Loading...",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Flexible(
                    child: Column(
                      children: [
                        Flexible(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (ctx, index) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 2),
                                        child: Card(
                                          color: Colors.cyan.shade50,
                                          //shadowColor: Colors.red,
                                          elevation: 8,
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),

                                          child: Container(
                                            // color: Colors.red,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                8.5,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.2,
                                            //padding: EdgeInsets.fromLTRB(10, 15, 50, 15),
                                            child: ListTile(
                                              contentPadding:
                                                  EdgeInsets.all(15.0),
                                              // leading: Container(
                                              //   height: 50,
                                              //   width: 50,
                                              //   decoration: BoxDecoration(
                                              //     shape: BoxShape.circle,
                                              //     border: Border.all(color: Colors.red.shade900),
                                              //     image: DecorationImage(
                                              //       image: NetworkImage(snapshot.data[index].image),
                                              //     ),
                                              //   ),
                                              // ),
                                              title: Row(
                                                children: [
                                                  Text("Donor name:"),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    snapshot.data[index].name,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.lora(
                                                        fontSize: 15,
                                                        color: Colors
                                                            .pink.shade700),
                                                  ),
                                                ],
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Text("Donor Place:"),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    snapshot.data[index].place,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.lora(
                                                        fontSize: 15,
                                                        color: Colors
                                                            .pink.shade700),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text("details"),
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        View_User_Donation_Detail_Page(
                                                                          donation_data:
                                                                              snapshot.data[index],
                                                                        )));
                                                      },
                                                      icon: Icon(Icons
                                                          .arrow_forward_ios_rounded))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Hope_User_Money_Donation()));
                  },
                  child: Container(
                    height: 50,
                    color: Colors.pink.shade50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Donate",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.red.shade900),
                        ),
                        // Text(
                        //   "\$${returnTotalAmount(_user)}",
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.w700, fontSize: 20),
                        // ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> delrecord(String id) async {
    String url =
        "https://anthracitic-pecks.000webhostapp.com/scan_copy/Customer/CartDelete.php";
    var res = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    var resoponse = jsonDecode(res.body);
    if (resoponse["success"] == "true") {
      print(id);
      // setState(() {
      getRequest();
      // });

    } else {
      print("some issue");
    }
  }
}
