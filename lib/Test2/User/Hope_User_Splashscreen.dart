import 'dart:async';
import 'dart:ui';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../main.dart';
import 'Hope_User_Dashboard.dart';
import 'Hope_User_Login.dart';





class Hope_User_Splash extends StatefulWidget {
  _Hope_User_SplashState createState() => _Hope_User_SplashState();
}

class _Hope_User_SplashState extends State<Hope_User_Splash> {

  void initState() {
    checkHopeUserLoogedIn();
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
  Future HopeUser_gotoLogin() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Hope_use_Login()));
  }


  Future<void> checkHopeUserLoogedIn() async{
    final _Hope_AdminsharedPrefs =await SharedPreferences.getInstance();
    print(Hope_user_Key);
    final _merchantLoggedIn=_Hope_AdminsharedPrefs.getBool(Hope_user_Key);
    if(_merchantLoggedIn == null || _merchantLoggedIn == false){
      HopeUser_gotoLogin();
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Hope_User_Dashboard()));
    }

  }


}