import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'View_event_detail_page.dart';

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

class Hope_Admin_event_Display extends StatefulWidget {
  @override
  _Hope_Admin_event_DisplayState createState() =>
      _Hope_Admin_event_DisplayState();
}

class _Hope_Admin_event_DisplayState extends State<Hope_Admin_event_Display> {
  //Applying get request.
  Future<List<event_data_model>> getRequest() async {
    //replace your restFull API here.

    final response = await http.get(Uri.parse(
        "http://192.168.29.64/MySampleApp/Charity_Hope/event_Display.php"
    ));

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
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.pink.shade300,
        centerTitle: true,
        title: Text(
          "Events",
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
                                              contentPadding: EdgeInsets.all(15.0),
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
                                                children:[
                                                  Text("Event name:"),
                                                  SizedBox(width: 10,),
                                                  Text(snapshot.data[index].name,
                                                  overflow: TextOverflow.ellipsis,
                                                  style:
                                                  GoogleFonts.lora(fontSize: 15, color: Colors.pink.shade700),
                                                ),
                                              ],
                                              ),
                                              subtitle: Row(
                                                children:[
                                                  Text("Event date:"),
                                                  SizedBox(width: 10,),
                                                  Text(snapshot.data[index].event_date,
                                                    overflow: TextOverflow.ellipsis,
                                                    style:
                                                    GoogleFonts.lora(fontSize: 15, color: Colors.pink.shade700),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Text("details"),
                                                  IconButton(onPressed: (){
                                                    Navigator.push(context, MaterialPageRoute
                                                      (builder: (context)=>View_Event_Detail_Page(data_event: snapshot.data[index],)));
                                                  }, icon: Icon(Icons.arrow_forward_ios_rounded))
                                                ],  ),

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


// child: Column(
//   children: [
//     Flexible(
//       child: ListView.builder(
//           shrinkWrap: true,
//           itemCount: snapshot.data.length,
//           itemBuilder: (ctx, index) {
//             return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 2),
//                     child: Card(
//                       shadowColor: Colors.red,
//                       elevation: 8,
//                       clipBehavior: Clip.antiAlias,
//                       shape: RoundedRectangleBorder(
//                         borderRadius:
//                             BorderRadius.circular(10),
//                       ),
//                       child: Container(
//                         // color: Colors.red,
//                         height: MediaQuery.of(context)
//                                 .size
//                                 .height /
//                             15,
//                         width: MediaQuery.of(context)
//                                 .size
//                                 .width /
//                             1.2,
//                         padding: EdgeInsets.fromLTRB(
//                             10, 15, 50, 15),
//                         child: Row(
//                           crossAxisAlignment:
//                               CrossAxisAlignment.start,
//                           children: [
//
//                             Text(
//                               "Event Name : " +
//                                   snapshot
//                                       .data[index].name,
//                             ),
//                             //SizedBox(width: 160,),
//
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//             );
//           }),
//     ),
//   ],
// ),