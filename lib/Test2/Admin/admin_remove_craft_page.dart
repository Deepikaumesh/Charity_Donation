import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Hope_Admin_Dashboard.dart';

class craft_model {
  final String id;
  final String name;
  final String craft_id;
  final String price;
  final String description;
  final String image;

  craft_model({
    required this.id,
    required this.name,
    required this.craft_id,
    required this.price,
    required this.description,
    required this.image,
  });
}

class Admin_remove_Craftitem_page extends StatefulWidget {
  const Admin_remove_Craftitem_page({Key? key}) : super(key: key);

  @override
  _Admin_remove_Craftitem_pageState createState() =>
      _Admin_remove_Craftitem_pageState();
}

class _Admin_remove_Craftitem_pageState
    extends State<Admin_remove_Craftitem_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Remove craft item",
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
                                              leading: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color:
                                                          Colors.red.shade900),
                                                  image: DecorationImage(
                                                    image: NetworkImage(snapshot
                                                        .data[index].image),
                                                  ),
                                                ),
                                              ),
                                              title: Text(
                                                "Craft name:" +
                                                    snapshot.data[index].name,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.lora(
                                                    fontSize: 15,
                                                    color:
                                                        Colors.pink.shade700),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Text(
                                                    "Craft price:" +
                                                        snapshot
                                                            .data[index].price,
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
                                                  TextButton(
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder: (_) {
                                                              return AlertDialog(
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(16),
                                                                ),
                                                                title: Text("Delete Product!"),
                                                                content: Text(
                                                                    "Are you sure want to delete the Product from stock?"),
                                                                actions: [
                                                                  TextButton(
                                                                      onPressed: () {
                                                                        setState(() {
                                                                          remove_admin_craft(
                                                                              snapshot.data[index].id);
                                                                        });
                                                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>Hope_Admin_Dashboard ()));
                                                                      },
                                                                      child: Text("ok")),
                                                                  TextButton(
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      child: Text("cancel")),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      child: Text(
                                                        "Remove",
                                                        style: TextStyle(
                                                          color: Colors
                                                              .cyan.shade800,
                                                          //decoration: TextDecoration.underline,
                                                        ),
                                                      )),
                                                  Icon(
                                                    Icons.delete,
                                                    color: Colors.cyan.shade800,
                                                    size: 20,
                                                  )
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
          ],
        ),
      ),
    );
  }

  Future<List<craft_model>> getRequest() async {
    //replace your restFull API here.

    final response = await http.get(Uri.parse(
        "http://192.168.29.64/MySampleApp/Charity_Hope/Admin_craft_Display.php"));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<craft_model> users = [];
    for (var singleUser in responseData) {
      craft_model user = craft_model(
        // productqty: singleUser["productqty"].toString(),

        name: singleUser["name"].toString(),
        id: singleUser["id"].toString(),
        craft_id: singleUser["id"].toString(),
        price: singleUser["craft_id"].toString(),
        description: singleUser["description"].toString(),
        image: singleUser["image"].toString(),
      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  Future<void> remove_admin_craft(String id) async {
    String url =
        "http://192.168.29.64/MySampleApp/Charity_Hope/admin_craft_delte.php";
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
