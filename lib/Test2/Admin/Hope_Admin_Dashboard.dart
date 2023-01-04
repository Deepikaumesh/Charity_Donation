import 'package:chari/Test2/Admin/Hope_Admin_Login.dart';
import 'package:chari/Test2/Admin/food_donation_bookings.dart';
import 'package:chari/Test2/Admin/view_donations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screen/Hope_main_way.dart';
import 'Hope_Admin_Drawer.dart';
import 'Hope_Admin_View_events.dart';
import 'View_more_Page_food_bookings.dart';
import 'admin_view_craft.dart';

class Hope_Admin_Dashboard extends StatefulWidget {
  const Hope_Admin_Dashboard({Key? key}) : super(key: key);

  @override
  _Hope_Admin_DashboardState createState() => _Hope_Admin_DashboardState();
}

class _Hope_Admin_DashboardState extends State<Hope_Admin_Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.shade300,
        title: Text("Admin Dashboard"),
        //   leading: IconButton(onPressed: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Hope_Main_Way()));
        //   },icon: Icon(Icons.arrow_back),),
        actions: [
          IconButton(
              onPressed: () {
                Customer_Signout(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    //border: Border.all(width: 0.5,color: Colors.pink),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage("assets/images/orphan.jpg"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 65, vertical: 10),
                height: 50,
                width: MediaQuery.of(context).size.width / 1.2,
                child: Text(
                  "Events and Donations",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                color: Colors.blueGrey.shade100,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Hope_Admin_event_Display()));
                        },
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              // border: Border.all(width: 0.5),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.yellow,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/events.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Text(
                        "Events",
                        style: TextStyle(
                            color: Colors.pink.shade300,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => donation_Display()));
                        },
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              //border: Border.all(width: 0.5),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.yellow,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/donation.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Text(
                        "Donations",
                        style: TextStyle(
                            color: Colors.pink.shade300,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                //padding: EdgeInsets.only(right: 180),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Food Donation Bookings",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            food_donation_bookings();
                          });
                        },
                        child: Text("Refresh"))
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.2,
                color: Colors.pink.shade200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Date",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    Text("Donor",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    Text("Food",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              food_donation_bookings(),
              SizedBox(
                height: 5,
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>food_donation_bookings_view_more()));
                  },
                  child: Text("View more",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ),
                padding: EdgeInsets.only(left: 250),
              ),
              Container(
                padding: EdgeInsets.only(right: 225),
                child: Text(
                  "Craft Shop",
                  style: TextStyle(
                      color: Colors.pink.shade300,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_View_Craftitem_()));
                },
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      //border: Border.all(width: 0.5),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.yellow,
                      image: DecorationImage(
                          image: AssetImage("assets/images/crafts.jpg"),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Customer_Signout(BuildContext ctx) async //using navigator so we need context
  {
    final _CustomersharedPrefs = await SharedPreferences.getInstance();
    await _CustomersharedPrefs.clear();
    //push new page and remove all other pages

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctx1) => Hope_Admin_Login()),
        (route) => false);
  }
}
