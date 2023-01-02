import 'package:chari/Test2/Admin/Hope_Admin_Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screen/Hope_main_way.dart';
import 'Hope_Admin_Drawer.dart';
import 'Hope_Admin_View_events.dart';

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
        centerTitle: true,
        backgroundColor: Colors.pink.shade300,
        title: Text("Admin Dashboard"),
        //   leading: IconButton(onPressed: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Hope_Main_Way()));
        //   },icon: Icon(Icons.arrow_back),),
        actions: [
          IconButton(
              onPressed: () {
                Customer_Signout(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5,color: Colors.pink),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage("assets/images/orphanage.jpg"),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Hope_Admin_event_Display()));
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.5),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.yellow,
                            image: DecorationImage(
                                image: AssetImage("assets/images/events.jpg"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Text("Events",style: TextStyle(color: Colors.pink.shade300,fontWeight: FontWeight.bold,fontSize: 20),)
                  ],
                ),
                Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.yellow,
                          image: DecorationImage(
                              image: AssetImage("assets/images/events.jpg"),
                              fit: BoxFit.fill)),
                    ),
                    Text("Donation",style: TextStyle(color: Colors.pink.shade300,fontWeight: FontWeight.bold,fontSize: 20),)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Customer_Signout(BuildContext ctx) async //using navigator so we need context
  {
    final _CustomersharedPrefs = await SharedPreferences.getInstance();
    await _CustomersharedPrefs.clear();
    //push new page and remove all other pages

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctx1) => Customer_Login()),
        (route) => false);
  }
}
