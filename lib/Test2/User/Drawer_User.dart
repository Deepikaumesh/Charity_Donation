import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Admin/Add_event_Admin.dart';
import 'Food_donation_bookings_User.dart';
import 'Event_Registration_User_.dart';
import 'Money_Donation_User.dart';
import 'My_Orders.dart';
import 'Searchbar_Page.dart';
import 'cancel_Event_Registration.dart';
import 'cancel_food_donations.dart';




class UserDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70.0,
                  backgroundImage: AssetImage(
                    "assets/images/orphans.jpg",
                  ),
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Hope",
                    style: GoogleFonts.aclonica(
                      color: Colors.pink,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),



        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Hope_User_Money_Donation()));
          },
          leading: Icon(
            Icons.monetization_on_rounded,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Donate Money",
              style: GoogleFonts.prompt(
                fontSize: 15,
              )),
        ),



        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Hope_User_event_registration()));
          },
          leading: Icon(
            Icons.event,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Event Registration",
              style: GoogleFonts.prompt(
                fontSize: 15,
              )),
        ),




        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => User_Event_Reistration_cancel()));
          },
          leading: Icon(
            Icons.event,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Cancel Event Registration",
              style: GoogleFonts.prompt(
                fontSize: 15,
              )),
        ),



        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Hope_User_food_donation_bookings()));
          },
          leading: Icon(
            Icons.fastfood_rounded,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Food  donation bookings",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),

        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => User_food_donation_cancel()));
          },
          leading: Icon(
            Icons.cancel,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Cancel food bookings",
              style: GoogleFonts.prompt(
                fontSize: 15,
              )),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => My_Orders()));
          },
          leading: Icon(
            Icons.card_giftcard,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("My Orders",
              style: GoogleFonts.prompt(
                fontSize: 15,
              )),
        ),





        // ListTile(
        //   onTap: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => Searchbar_Page()));
        //   },
        //   leading: Icon(
        //     Icons.cancel,
        //     color: Colors.blueGrey.shade900,
        //   ),
        //   title: Text("searchbar",
        //       style: GoogleFonts.prompt(fontSize: 15)),
        // ),


      ]),
    );
  }
}
