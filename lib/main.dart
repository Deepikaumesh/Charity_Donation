import 'package:flutter/material.dart';
import 'Test2/Screen/Hope_main_way.dart';



const Hope_Admin_Key = "Admin LoggedIn";
const Hope_user_Key = "user LoggedIn";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Hope_Main_Way(),
    );
  }
}
