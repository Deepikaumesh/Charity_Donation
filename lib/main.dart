import 'package:flutter/material.dart';

import 'Test2/Screen/Hope_main_way.dart';

var uid_user ='';
var access_total_amt ='';


// // @dart=2.9
// const Hope_Admin_Key = "Admin LoggedIn";
// const Hope_user_Key = "user LoggedIn";

var ip='192.168.29.64';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //
      //   splashColor: Colors.transparent,
      //
      //   highlightColor: Colors.transparent,
      //
      //   hoverColor: Colors.transparent,
      //
      // ),
      debugShowCheckedModeBanner: false,
      home: Hope_Main_Way(),
    );
  }
}




