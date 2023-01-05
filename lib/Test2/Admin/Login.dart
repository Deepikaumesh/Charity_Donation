import 'dart:convert';

import 'package:chari/Test2/Admin/Dashboard.dart';
import 'package:chari/Test2/Admin/Registration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';



class Hope_Admin_Login extends StatefulWidget {
  const Hope_Admin_Login({Key? key}) : super(key: key);

  @override
  _Hope_Admin_LoginState createState() => _Hope_Admin_LoginState();
}

class _Hope_Admin_LoginState extends State<Hope_Admin_Login> {
  TextEditingController Admin_user = TextEditingController();
  TextEditingController Admin_pass = TextEditingController();
  final GlobalKey<FormState> Admin_formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('assets/images/log.png'), fit: BoxFit.cover),
      // ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.blueGrey, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Form(
                        key: Admin_formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: Admin_user,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter username";
                                }
                                return null;
                              },
                              onSaved: (name) {},
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Username",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: Admin_pass,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter password";
                                }
                                return null;
                              },
                              onSaved: (name) {},
                              style: TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          // login();
                                        });
                                        Admin_Login();

                                        if (Admin_formkey.currentState!.validate()) {
                                          print("Successfully  logged");
                                          Admin_user.clear();
                                          Admin_pass.clear();
                                        }
                                      }),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // Navigator.pushNamed(context, 'register');
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyRegister()));
                                  },
                                  child: Text(
                                    'Does not have an account?',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18),
                                  ),
                                  style: ButtonStyle(),
                                ),
                                TextButton(
                                    onPressed: () {
                                      // Navigator.pushNamed(context, 'register');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Hope_Admin_Registration()));
                                    },
                                    child: Text(
                                      //  'Forgot Password',
                                      'Sign Up',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xff4c505b),
                                        fontSize: 18,
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future Admin_Login() async {
    //var url ="https://anthracitic-pecks.000webhostapp.com/Hope_Charity_Project/Admin/Hope_Admin_Login.php"; //intego wifi password
    var url ="http://192.168.29.64/MySampleApp/Charity_Hope/Hope_Admin_login.php";
    var response = await http.post(Uri.parse(url),
        headers: {
          'Accept':'application/json'
        },

        body: {
          "username": Admin_user.text,
          "password": Admin_pass.text,
        });
    var data = json.decode(response.body);
    // if (data.toString() == "Success") {
    if (data!=null) {
      //var responseData = json.decode(response.body);


      for (var singleUser in data) {
        print(singleUser["id"]);
        final _CustomersharedPrefs = await SharedPreferences.getInstance();
        // await _CustomersharedPrefs.setBool(Customer_Key, true);
        await _CustomersharedPrefs.setString("useid", singleUser["id"]);

        // print(response);
        //Customer_Key=singleUser["id"];
        //print("key:"+Customer_Key);
      }

      final snackBar = SnackBar(
        content: Text('Login Successfull'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // final _CustomersharedPrefs = await SharedPreferences.getInstance();
      // // await _CustomersharedPrefs.setBool(Customer_Key, true);
      // await _CustomersharedPrefs.setInt("userid", data["id"]);


      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Hope_Admin_Dashboard()));
      print("username:");
      // Customer_Key=data["id"];
      //print(data["id"]);
      // print(Customer_Key);
      // print(data);


    } else {
      final snackBar = SnackBar(
        content: Text('Username and password invalid'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
