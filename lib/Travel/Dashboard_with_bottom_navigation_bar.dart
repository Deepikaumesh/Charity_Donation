import 'package:chari/Test2/Admin/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Hope_Admin_Dashboard extends StatefulWidget {
  const Hope_Admin_Dashboard({Key? key}) : super(key: key);

  @override
  _Hope_Admin_DashboardState createState() => _Hope_Admin_DashboardState();
}

class _Hope_Admin_DashboardState extends State<Hope_Admin_Dashboard> {

  int currentIndex = 0;
  final screens =[
    // Home(),
    // Hope_Admin_event_Display(),
    // donation_Display(),
    // Admin_View_Craftitem_(),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body:screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // disable the animation
        backgroundColor: Colors.white,
        elevation: 4,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        //  iconSize: 40,
        selectedFontSize: 15,
        unselectedFontSize: 13,
        //  showSelectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) =>setState(() =>currentIndex = index),
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
        ],
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
