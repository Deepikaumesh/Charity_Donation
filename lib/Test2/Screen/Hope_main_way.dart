import 'package:chari/Test2/Admin/Dashboard.dart';
import 'package:flutter/material.dart';

import '../Admin/Hope_Admin_Splashscreen.dart';
import '../User/Hope_User_Splashscreen.dart';




class Hope_Main_Way extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 400,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      //   check_Hope_Admin_LogedIn();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_Splashscreen()));
                  //    Navigator.push(context, MaterialPageRoute(builder: (context)=>Hope_Admin_Dashboard()));


                    },
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/images/user.png",
                            height: 140,
                            width: 140,
                          ),
                        ),
                        Text("Admin")
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Hope_User_Splash()));
                    },
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/images/user.png",
                            height: 140,
                            width: 140,
                          ),
                        ),
                        Text("User")
                      ],
                    ),
                  ),
                ],
              ),
           //    GestureDetector(
           //      onTap: (){
           // //       Navigator.push(context, MaterialPageRoute(builder: (context)=>gust_Splash()));
           //      },
           //      child: Column(
           //        children: [
           //          Container(
           //            child: Image.asset(
           //              "assets/images/user.png",
           //              height: 140,
           //              width: 140,
           //            ),
           //          ),
           //          Text("Guest")
           //        ],
           //      ),
           //    ),
            ],
          ),
        )
    );
  }
}
