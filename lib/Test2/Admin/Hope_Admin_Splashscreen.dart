import 'dart:async';
import 'dart:ui';


import 'package:chari/Test2/Admin/Login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Dashboard.dart';




class Admin_Splashscreen extends StatefulWidget {
  _Admin_SplashscreenState createState() => _Admin_SplashscreenState();
}

class _Admin_SplashscreenState extends State<Admin_Splashscreen> {

  void initState() {
    checkAdminLogedIn();
    super.initState();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,


      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "welcome",
            style: GoogleFonts.aclonica(
              color: Colors.red.shade900,
              fontSize: 11.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],


      ),
    );
  }
  Future gotoLogin_Admin() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Hope_Admin_Login()));
  }



  Future<void> checkAdminLogedIn() async{
    final _sharedPrefs =await SharedPreferences.getInstance();
    // print("first key check "+Customer_Key);
    final _userid=_sharedPrefs.getString("useid");

    if(_userid == null){
      gotoLogin_Admin();
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Hope_Admin_Dashboard()));
    }

  }



}