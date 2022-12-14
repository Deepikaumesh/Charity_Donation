import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../main.dart';
import 'Hope_User_Dashboard.dart';
import 'Hope_User_Registration.dart';




class Hope_use_Login extends StatefulWidget {
  const Hope_use_Login({Key? key}) : super(key: key);

  @override
  _Hope_use_LoginState createState() => _Hope_use_LoginState();
}

class _Hope_use_LoginState extends State<Hope_use_Login> {
  TextEditingController hope_user_user = TextEditingController();
  TextEditingController Hope_user_pass = TextEditingController();
  final GlobalKey<FormState> Merchant_formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.white,
      //   image: DecorationImage(
      //       image: AssetImage('assets/images/log.png'), fit: BoxFit.cover),
       ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.black, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery
                        .of(context)
                        .size
                        .height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Form(
                        key: Merchant_formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: hope_user_user,
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
                              controller: Hope_user_pass,
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
                                          Hope_User_Login();
                                        });

                                        if (Merchant_formkey.currentState!.validate()) {
                                          print("Successfully  logged");
                                          hope_user_user.clear();
                                          Hope_user_pass.clear();
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
                                    //Navigator.pushNamed(context, 'register');
                                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Hope_Ad_Registration()));
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Hope_User_Registration()));
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

Future Hope_User_Login() async {
  var url =
      "http://192.168.29.64/MySampleApp/Charity_Hope/Hope_User_login.php"; //intego wifi password
  //  var url ="https://anthracitic-pecks.000webhostapp.com/login.php";
  var response = await http.post(Uri.parse(url), body: {
    "username": hope_user_user.text,
    "password": Hope_user_pass.text,
  });
  var data = json.decode(response.body);
  if (data.toString() == "Success") {
    // await  SessionManager().set('token', user.text);

    final snackBar = SnackBar(
      content: Text('Login Successfull'),
      duration: Duration(seconds: 1),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {
       //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Merchant_Dashboard()));
          // Some code to undo the change.
        },
      ),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    final _sharedPrefs = await SharedPreferences.getInstance();

    await _sharedPrefs.setBool(Hope_user_Key, true);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Hope_User_Dashboard()));
    print("username:");
  } else {
    final snackBar = SnackBar(
      content: Text('Username and password invalid'),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {
        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Merchant_Dashboard()));
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