
import 'package:chari/Test1/screens/explore.dart';
import 'package:chari/Test1/screens/heart.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _children = [
    Heart(),
    Explore(),
    Container(),
    Container(),
    Container(),
  ];

  void onTabTapped(int index){
    setState(() {
     _currentIndex = index; 
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        elevation: 0,
        iconSize: 32,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
        label:"Heart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label:"Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label:"Signal",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add),
            label:"Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label:"Profile",
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}