import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import 'Dashboard_User.dart';
import 'Food_donation_bookings_User.dart';
import 'Food_donation_details_page_User_.dart';




//Creating a class user to store the data;
class event_model {
  // final String id;
  final String id;
  final String name;
  final String event_date;
  final String event_time;
  final String description;


  event_model({
    required this.id,
    required this.name,
    required this.event_date,
    required this.event_time,
    required this.description,
  });
}

class User_Event_Reistration_cancel extends StatefulWidget {
  @override
  _User_Event_Reistration_cancelState createState() => _User_Event_Reistration_cancelState();
}

class _User_Event_Reistration_cancelState extends State<User_Event_Reistration_cancel> {
//Applying get request.

  Future<List<event_model>> getRequest() async {
    //replace your restFull API here.
    // final _sharedPrefs = await SharedPreferences.getInstance();
    // final  ui = _sharedPrefs.getString("id");
    String url =
        "http://$ip/MySampleApp/Charity_Hope/cancel_event_registration.php?uid="+uid_user!;

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<event_model> users = [];
    for (var singleUser in responseData) {
      event_model user = event_model(
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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
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
                                                  Text("Date:"),
                                                  SizedBox(width: 10,),
                                                  Text(snapshot.data[index].event_date,
                                                    overflow: TextOverflow.ellipsis,
                                                    style:
                                                    GoogleFonts.lora(fontSize: 15, color: Colors.pink.shade700),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Text("Cancel",style: TextStyle(color: Colors.orange),),
                                                  IconButton(
                                                      onPressed: () {
                                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewcart_customer()));
                                                        // setState(() {
                                                        //   delrecord(snapshot
                                                        //       .data[index].cid);
                                                        // });
                                                        showDialog(
                                                            context: context,
                                                            builder: (_) {
                                                              return AlertDialog(
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(16),
                                                                ),
                                                                title: Text("Remove item",style: TextStyle(color: Colors.pink.shade500),),
                                                                content: Text(
                                                                    "Are You sure want to remove the product from cart"),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () {
                                                                      setState(() {
                                                                        delrecord(snapshot
                                                                            .data[index].id);
                                                                      });
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) =>
                                                                                  Hope_User_Dashboard()));
                                                                    },
                                                                    child: Text("ok",style: TextStyle(color: Colors.pink.shade500,)),),
                                                                  TextButton(
                                                                    onPressed: () {
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child: Text("cancel",style: TextStyle(color: Colors.pink.shade500)),),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      icon: Icon(Icons.clear,
                                                          size: 20,
                                                          color: Colors
                                                              .red.shade900)),
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
            Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Hope_User_food_donation_bookings()));
                  },
                  child: Container(
                    height: 50,
                    color: Colors.pink.shade50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Donate Food",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20,color: Colors.red.shade900),
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
        "http://$ip/MySampleApp/Charity_Hope/delete_eventregistration_user.php";
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
