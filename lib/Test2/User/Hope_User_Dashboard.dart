import 'package:chari/Test2/Admin/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screen/Hope_main_way.dart';
import 'Hope_User_Login.dart';

class Hope_User_Dashboard extends StatefulWidget {
  const Hope_User_Dashboard({Key? key}) : super(key: key);

  @override
  _Hope_User_DashboardState createState() => _Hope_User_DashboardState();
}

class _Hope_User_DashboardState extends State<Hope_User_Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("User Dashboard"),
        leading: IconButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Hope_Main_Way()));
        },icon: Icon(Icons.arrow_back),),
        actions: [
          IconButton(onPressed: (){
            Hope_User_Signout(context);
          }, icon:Icon(Icons.exit_to_app))
        ],
      ),
    );
  }
  Hope_User_Signout(BuildContext ctx) async //using navigator so we need context
      {
    final _UsersharedPrefs = await SharedPreferences.getInstance();
    await _UsersharedPrefs.clear();
    //push new page and remove all other pages

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctx1) => Hope_use_Login()),
            (route) => false);
  }
}

