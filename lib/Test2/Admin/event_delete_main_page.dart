import 'dart:convert';
import 'package:chari/Test2/Admin/Hope_Admin_Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Hope_Admin_Drawer.dart';


//Creating a class user to store the data;
class event_data_model {
  final String id;
  final String name;
  final String event_date;
  final String event_time;
  final String description;

  event_data_model({
    required this.id,
    required this.name,
    required this.event_date,
    required this.event_time,
    required this.description,
  });
}

class Hope_Admin_event_Display_delete_page extends StatefulWidget {
  @override
  _Hope_Admin_event_Display_delete_pageState createState() =>
      _Hope_Admin_event_Display_delete_pageState();
}

class _Hope_Admin_event_Display_delete_pageState
    extends State<Hope_Admin_event_Display_delete_page> {
  //Applying get request.
  Future<List<event_data_model>> getRequest() async {
    //replace your restFull API here.

    final response = await http.get(Uri.parse(
        "http://192.168.29.64/MySampleApp/Charity_Hope/event_Display.php"));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<event_data_model> users = [];
    for (var singleUser in responseData) {
      event_data_model user = event_data_model(
        // productqty: singleUser["productqty"].toString(),

        name: singleUser["name"].toString(),
        event_date: singleUser["event_date"].toString(),
        event_time: singleUser["event_time"].toString(),
        description: singleUser["description"].toString(),
        id: singleUser["id"].toString(),
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
        title: Text(
          "Delete Event",
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
                                            shadowColor: Colors.red,
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
                                                  13,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                                  1.2,
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 5, 50, 15),
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  //
                                                  // SizedBox(
                                                  //   width: 10,
                                                  // ),
                                                 IconButton(onPressed: (){
                                                   // setState(() {
                                                   //   delrecord(
                                                   //       snapshot.data[index].id);
                                                   // });
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
                                                                     delrecord(
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

                                                 }, icon: Icon(Icons.delete,size: 30,color: Colors.red.shade900,),),

                                                // Icon(Icons.delete,size: 18,color: Colors.red.shade900,),
                                                  SizedBox(
                                                    width: 10,
                                                  ),

                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      SizedBox(height: 10,),
                                                      Text(
                                                        "Event Name : " +
                                                            snapshot.data[index]
                                                                .name,
                                                      ),
                                                      SizedBox(height: 5,),
                                                      Text(
                                                        "Event date: " +
                                                            snapshot.data[index]
                                                                .event_date,style: TextStyle(fontSize: 10),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
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

  Future<void> delrecord(String id) async {
    String url =
        "http://192.168.29.64/MySampleApp/Charity_Hope/event_delete.php";
    var res = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    var resoponse = jsonDecode(res.body);
    if (resoponse["success"] == "true") {
      print(id);
       setState(() {
      getRequest();
       });



    } else {
      print("some issue");
    }
  }
}
