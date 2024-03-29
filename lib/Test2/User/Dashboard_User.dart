import 'package:chari/Test2/Admin/View_donations_Admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Admin/View_events_Admin.dart';
import 'Display_order_User.dart';
import 'Home_User.dart';
import 'Login_User.dart';
import 'View_Cart_User.dart';

class Hope_User_Dashboard extends StatefulWidget {
  const Hope_User_Dashboard({Key? key}) : super(key: key);

  @override
  _Hope_User_DashboardState createState() => _Hope_User_DashboardState();
}

class _Hope_User_DashboardState extends State<Hope_User_Dashboard> {
  int currentIndex = 0;
  final screens = [
    Home_User(),
    Hope_Admin_event_Display(),
    donation_Display(),
    Viewcart_User(),
   // My_Order_User(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.pink.shade300,
      //   title: Text("Admin Dashboard"),
      //   //   leading: IconButton(onPressed: (){
      //   // Navigator.push(context, MaterialPageRoute(builder: (context)=>Hope_Main_Way()));
      //   //   },icon: Icon(Icons.arrow_back),),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Customer_Signout(context);
      //         },
      //         icon: Icon(Icons.exit_to_app))
      //   ],
      // ),
      // drawer: Drawer(
      //   child: MainDrawer(),
      // ),
      body: screens[currentIndex],
      // Center(
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         Container(
      //           height: MediaQuery.of(context).size.height / 3,
      //           width: MediaQuery.of(context).size.width / 1.1,
      //           decoration: BoxDecoration(
      //               //border: Border.all(width: 0.5,color: Colors.pink),
      //               borderRadius: BorderRadius.circular(8),
      //               image: DecorationImage(
      //                   image: AssetImage("assets/images/orphan.jpg"),
      //                   fit: BoxFit.cover)),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Container(
      //           padding: EdgeInsets.symmetric(horizontal: 65, vertical: 10),
      //           height: 50,
      //           width: MediaQuery.of(context).size.width / 1.2,
      //           child: Text(
      //             "Events and Donations",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 20),
      //           ),
      //           color: Colors.blueGrey.shade100,
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 GestureDetector(
      //                   onTap: () {
      //                     Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (context) =>
      //                                 Hope_Admin_event_Display()));
      //                   },
      //                   child: Container(
      //                     height: 150,
      //                     width: 150,
      //                     decoration: BoxDecoration(
      //                         // border: Border.all(width: 0.5),
      //                         borderRadius: BorderRadius.circular(8),
      //                         color: Colors.yellow,
      //                         image: DecorationImage(
      //                             image: AssetImage("assets/images/events.jpg"),
      //                             fit: BoxFit.cover)),
      //                   ),
      //                 ),
      //                 Text(
      //                   "Events",
      //                   style: TextStyle(
      //                       color: Colors.pink.shade300,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 20),
      //                 )
      //               ],
      //             ),
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 GestureDetector(
      //                   onTap: () {
      //                     Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (context) => donation_Display()));
      //                   },
      //                   child: Container(
      //                     height: 150,
      //                     width: 150,
      //                     decoration: BoxDecoration(
      //                         //border: Border.all(width: 0.5),
      //                         borderRadius: BorderRadius.circular(8),
      //                         color: Colors.yellow,
      //                         image: DecorationImage(
      //                             image:
      //                                 AssetImage("assets/images/donation.jpg"),
      //                             fit: BoxFit.cover)),
      //                   ),
      //                 ),
      //                 Text(
      //                   "Donations",
      //                   style: TextStyle(
      //                       color: Colors.pink.shade300,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 20),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Container(
      //           //padding: EdgeInsets.only(right: 180),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               Text("Food Donation Bookings",
      //                   style: TextStyle(
      //                       color: Colors.blueGrey,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 20)),
      //               TextButton(
      //                   onPressed: () {
      //                     setState(() {
      //                       food_donation_bookings();
      //                     });
      //                   },
      //                   child: Text("Refresh"))
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           height: 5,
      //         ),
      //         Container(
      //           height: 50,
      //           width: MediaQuery.of(context).size.width / 1.2,
      //           color: Colors.pink.shade200,
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             children: [
      //               Text("Date",
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 15)),
      //               Text("Donor",
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 15)),
      //               Text("Food",
      //                   style: TextStyle(
      //                       color: Colors.white,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 15)),
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           height: 5,
      //         ),
      //         food_donation_bookings(),
      //         SizedBox(
      //           height: 5,
      //         ),
      //         Container(
      //           child: TextButton(
      //             onPressed: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) =>
      //                           food_donation_bookings_view_more()));
      //             },
      //             child: Text("View more",
      //                 style: TextStyle(
      //                     decoration: TextDecoration.underline,
      //                     color: Colors.blueGrey,
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 15)),
      //           ),
      //           padding: EdgeInsets.only(left: 250),
      //         ),
      //         Container(
      //           padding: EdgeInsets.only(right: 225),
      //           child: Text(
      //             "Craft Shop",
      //             style: TextStyle(
      //                 color: Colors.pink.shade300,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 20),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 5,
      //         ),
      //         GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => Admin_View_Craftitem_()));
      //           },
      //           child: Container(
      //             height: 120,
      //             width: MediaQuery.of(context).size.width / 1.2,
      //             decoration: BoxDecoration(
      //                 //border: Border.all(width: 0.5),
      //                 borderRadius: BorderRadius.circular(8),
      //                 color: Colors.yellow,
      //                 image: DecorationImage(
      //                     image: AssetImage("assets/images/crafts.jpg"),
      //                     fit: BoxFit.cover)),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 10,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // disable the animation
        backgroundColor: Colors.white,
        elevation: 4,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        //  iconSize: 40,
        selectedFontSize: 15,
        unselectedFontSize: 13,
        //  showSelectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'events',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_rounded),
            label: 'donations',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'view cart',
            backgroundColor: Colors.blue,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.shopping_bag_outlined),
          //   label: 'My orders',
          //   backgroundColor: Colors.blue,
          // ),


        ],
      ),
    );
  }

  userr_Signout(BuildContext ctx) async //using navigator so we need context
  {
    final _CustomersharedPrefs = await SharedPreferences.getInstance();
    await _CustomersharedPrefs.clear();
    //push new page and remove all other pages

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctx1) => Hope_use_Login()),
        (route) => false);
  }
}
