import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Add_event_Admin.dart';
import 'View_more_Page_food_bookings_Admin.dart';



class View_food_donation_Detail_Page extends StatefulWidget {
  final food_donation_model data_food_donation;

  const View_food_donation_Detail_Page({required this.data_food_donation});

  @override
  _View_food_donation_Detail_PageState createState() => _View_food_donation_Detail_PageState();
}

class _View_food_donation_Detail_PageState extends State<View_food_donation_Detail_Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 380,left: 30,right: 30),
            child: Container(
              // color: Colors.red.shade50,
              height: MediaQuery.of(context).size.height/1.5,

              width: MediaQuery.of(context).size.width/1.2,
              child: Image.asset(
                "assets/images/food.png",
                fit: BoxFit.contain,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 400, left: 20, right: 20),
            child: Container(
              padding: EdgeInsets.all(20),
              height: 400,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.deepOrange.shade200,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child:   Row(
                      children:[
                        Icon(Icons.date_range,color: Colors.deepOrange.shade300,),
                        SizedBox(width: 10,),
                        Icon(Icons.arrow_forward,color: Colors.deepOrange.shade300,),
                        SizedBox(width: 10,),
                        Text(widget.data_food_donation.date,
                            style: GoogleFonts.prompt(
                                color: Colors.deepOrange.shade300, fontSize: 20)),
                      ], ),
                    color: Colors.white,
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child:   Row(
                      children:[
                        Icon(Icons.person,color: Colors.deepOrange.shade300,),
                        SizedBox(width: 10,),
                        Icon(Icons.arrow_forward,color: Colors.deepOrange.shade300,),
                        SizedBox(width: 20,),
                        Text(widget.data_food_donation.donor,
                            style: GoogleFonts.prompt(
                                color: Colors.deepOrange.shade300, fontSize: 20)),
                      ], ),
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child:   Row(
                      children:[
                        Icon(Icons.fastfood,color: Colors.deepOrange.shade300,),
                        SizedBox(width: 10,),
                        Icon(Icons.arrow_forward,color: Colors.deepOrange.shade300,),
                        SizedBox(width: 20,),
                        Text(widget.data_food_donation.food,
                            style: GoogleFonts.prompt(
                                color: Colors.deepOrange.shade300, fontSize: 20)),
                      ], ),
                    color: Colors.white,
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
