import 'dart:async';
import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../main.dart';
import 'Hope_Admin_Dashboard.dart';
import 'Hope_Admin_Login.dart';





class Hope_Admin_Splash extends StatefulWidget {
  _Hope_Admin_SplashState createState() => _Hope_Admin_SplashState();
}

class _Hope_Admin_SplashState extends State<Hope_Admin_Splash> {

  void initState() {
    checkHopeAdminLoogedIn(context);
    super.initState();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }


    // Timer(
    //   Duration(seconds: 2),
    //       () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MyLogin())),
    // );


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,


      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.red.shade900,
            strokeWidth: 5,
          ),
          SizedBox(height: 20,),
          Text(
            "Fetching all the details....",
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
  Future HopeAdmin_gotoLogin(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Hope_Admin_Login()));
  }


  Future<void> checkHopeAdminLoogedIn(BuildContext context) async{
    final _Hope_AdminsharedPrefs =await SharedPreferences.getInstance();
    print(Hope_Admin_Key);
    final _merchantLoggedIn=_Hope_AdminsharedPrefs.getBool(Hope_Admin_Key);
    if(_merchantLoggedIn == null || _merchantLoggedIn == false){
      HopeAdmin_gotoLogin(context);
    }
    else{
     // Navigator.push(context, MaterialPageRoute(builder: (context)=>Hope_Admin_Dashboard()));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Hope_Admin_Dashboard()));
    }

  }


}