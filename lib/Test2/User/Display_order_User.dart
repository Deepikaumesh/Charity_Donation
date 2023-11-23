import 'dart:convert';
import 'dart:ffi';
import 'package:chari/Test2/User/Dashboard_User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import 'Payment_user.dart';

//Creating a class user to store the data;
class Order_model {
  final String id;
  final String name;
  final String bank;
  final String ac_no;
  final String total_amt;
  final String cid;
  final String craft_id;

  Order_model({
    required this.id,
    required this.name,
    required this.bank,
    required this.ac_no,
    required this.total_amt,
    required this.cid,
    required this.craft_id,
  });
}

class My_Order_User extends StatefulWidget {
  @override
  _My_Order_UserState createState() => _My_Order_UserState();
}

class _My_Order_UserState extends State<My_Order_User> {
  num subTotal = 0;

  //Applying get request.
  Future<List<Order_model>> getRequest() async {
    //replace your restFull API here.
    String url =
        "http://$ip/MySampleApp/Charity_Hope/view_Payment.php";
    // "https://anthracitic-pecks.000webhostapp.com/Hope_Charity_Project/User/hope_cart_display_user.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Order_model> users = [];
    for (var singleUser in responseData) {
      Order_model user = Order_model(
        id: singleUser["id"].toString(),
        name: singleUser["name"].toString(),
        bank: singleUser["bank"].toString(),
        ac_no: singleUser["ac_no"].toString(),
        total_amt: singleUser["total_amt"].toString(),
        cid: singleUser["cartid"].toString(),
        craft_id: singleUser["craft_id"].toString(),
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
        backgroundColor: Colors.pink.shade300,
        centerTitle: true,
        title: Text(
          "My order",
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
                  List<Order_model> _user = snapshot.data;
                  return Flexible(
                    child: Column(
                      children: [
                        // Text("hai"),
                        Flexible(
                          child: ListView.builder(
                              // scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (ctx, index) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      Card(
                                        shadowColor: Colors.red,
                                        elevation: 8,
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Container(
                                          // color: Colors.red,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              5,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.fromLTRB(
                                              10, 15, 50, 15),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              //    Spacer(),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Name : " +
                                                        snapshot
                                                            .data[index].name,
                                                  ),
                                                  Text(
                                                    "Price : " +
                                                        snapshot
                                                            .data[index].bank,
                                                  ),
                                                  Text(
                                                    "craft id: " +
                                                        snapshot
                                                            .data[index].craft_id,
                                                  ),

                                                  // Text(
                                                  //   "Sub Total : " +
                                                  //       ProductCalculations
                                                  //           .getTotalRateFromString(
                                                  //           productPrice: snapshot
                                                  //               .data[index].price,
                                                  //           Quantity: snapshot
                                                  //               .data[index]
                                                  //               .qty),
                                                  // ),

                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Remove",
                                                        style:
                                                            GoogleFonts.aBeeZee(
                                                                color: Colors
                                                                    .red
                                                                    .shade900),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewcart_customer()));
                                                            // setState(() {
                                                            //   delrecord(snapshot
                                                            //       .data[index].cid);
                                                            // });
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder: (_) {
                                                                  return AlertDialog(
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16),
                                                                    ),
                                                                    title: Text(
                                                                      "Remove item",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .pink
                                                                              .shade500),
                                                                    ),
                                                                    content: Text(
                                                                        "Are You sure want to remove the product from cart"),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            delrecord(snapshot.data[index].cid);
                                                                          });
                                                                          Navigator.pushReplacement(
                                                                              context,
                                                                              MaterialPageRoute(builder: (context) => Hope_User_Dashboard()));
                                                                        },
                                                                        child: Text(
                                                                            "ok",
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.pink.shade500,
                                                                            )),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: Text(
                                                                            "cancel",
                                                                            style:
                                                                                TextStyle(color: Colors.pink.shade500)),
                                                                      ),
                                                                    ],
                                                                  );
                                                                });
                                                          },
                                                          icon: Icon(
                                                              Icons.clear,
                                                              size: 20,
                                                              color: Colors.red
                                                                  .shade900)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              // Padding(
                                              //     padding: EdgeInsets.only(
                                              //         top: 20, bottom: 20, left: 20),
                                              //
                                              //     child: IconButton(
                                              //         onPressed: () {
                                              //           showModalBottomSheet(context: context, builder: (context) =>
                                              //               Merchant_Update_Bottomsheet(
                                              //                 data_user: snapshot
                                              //                     .data[index],
                                              //               ));
                                              //         },
                                              //         icon: Icon(
                                              //             Icons.arrow_forward_ios)))
                                            ],
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

                        SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.orange.shade200,
                                child: Text(
                                  "Buy",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.pink.shade900),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Payment_User()));
                              },
                            )),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> delrecord(String id) async {
    String url =
        "http://$ip/MySampleApp/ORBVA/Admin/delete_workshop.php";
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
