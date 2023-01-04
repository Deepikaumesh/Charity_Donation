import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

//Creating a class user to store the data;
class food_donation_model {
  // final String id;
  final String id;
  final String date;
  final String donor;
  final String food;


  food_donation_model({
    // required this.id,
    required this.id,
    required this.date,
    required this.donor,
    required this.food,

  });
}

class food_bookings_cancel extends StatefulWidget {
  @override
  _food_bookings_cancelState createState() => _food_bookings_cancelState();
}

class _food_bookings_cancelState extends State<food_bookings_cancel> {
//Applying get request.

  Future<List<food_donation_model>> getRequest() async {
    //replace your restFull API here.
    String url =
        "http://192.168.29.64/MySampleApp/Charity_Hope/food_donation.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<food_donation_model> users = [];
    for (var singleUser in responseData) {
      food_donation_model user = food_donation_model(
        //id:  singleUser["id"].toString(),
        id: singleUser["id"].toString(),
        date: singleUser["date"].toString(),
        donor:singleUser["donor"].toString(),
        food: singleUser["food"].toString(),


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
          "Food Donations",
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
                                                6,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                1.2,
                                            padding: EdgeInsets.fromLTRB(
                                                10, 15, 50, 15),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [

                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Date : " +
                                                          snapshot
                                                              .data[index].date,
                                                    ),
                                                    Text(
                                                      "Donor : " +
                                                          snapshot
                                                              .data[index].donor,
                                                    ),
                                                    Text(
                                                      "Food : " +
                                                          snapshot
                                                              .data[index].food,
                                                    ),
                                                   TextButton(onPressed: (){}, child: Text("Cancel",style: TextStyle(fontSize: 18),))








                                                  ],
                                                ),
                                                //SizedBox(width: 160,),

                                                //IconButton(onPressed: (){}, icon: Icon(Icons.edit_note,size: 20,)),
                                              ],
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
}
