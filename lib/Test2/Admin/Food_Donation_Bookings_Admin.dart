import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

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

class food_donation_bookings extends StatefulWidget {
  @override
  _food_donation_bookingsState createState() => _food_donation_bookingsState();
}

class _food_donation_bookingsState extends State<food_donation_bookings> {
//Applying get request.

  Future<List<food_donation_model>> getRequest() async {
    //replace your restFull API here.
    String url =
        "http://$ip/MySampleApp/Charity_Hope/food_donation.php";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<food_donation_model> users = [];
    for (var singleUser in responseData) {
      food_donation_model user = food_donation_model(
        id: singleUser["id"].toString(),
        date: singleUser["date"].toString(),
        donor: singleUser["donor"].toString(),
        food:singleUser["food"].toString(),

      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // color: Colors.yellow,
      // padding: EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: getRequest(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 5,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Data Loading Please Wait!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.2,
              color: Colors.pink.shade100,
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(snapshot.data[index].date,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          Text(snapshot.data[index].donor,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          Text(snapshot.data[index].food,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 5,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
