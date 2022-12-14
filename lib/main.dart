import 'package:flutter/material.dart';
import 'Test2/Screen/Hope_main_way.dart';


//const admin_key="admin logged";
const Hope_Admin_Key = "Admin LoggedIn";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Hope_Admin_Main_Way(),
    );
  }
}
