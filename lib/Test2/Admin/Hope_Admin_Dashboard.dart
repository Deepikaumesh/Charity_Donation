import 'package:chari/Test2/Admin/Hope_Admin_Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        title: Text("Admin Dashboard"),
        actions: [
          IconButton(onPressed: (){
            Hope_Admin_Signout(context);
          }, icon:Icon(Icons.exit_to_app))
        ],
      ),
    );
  }
  Hope_Admin_Signout(BuildContext ctx) async //using navigator so we need context
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
