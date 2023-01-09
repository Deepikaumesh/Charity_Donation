import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AdminCatagory_image_buttons.dart';
import 'Admin_EventDisplay.dart';
import 'News_Container.dart';
import 'Service_Container.dart';





class Admin_HomePage extends StatefulWidget {
  const Admin_HomePage({Key? key}) : super(key: key);


  @override
  _Admin_HomePageState createState() => _Admin_HomePageState();
}

class _Admin_HomePageState extends State<Admin_HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FF),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Dashboard",
          style: GoogleFonts.aclonica(
            color: Colors.red.shade900,
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.red.shade900),
        elevation: 0.0,
        backgroundColor: Color(0xFFF6F7FF),
      ),



      // drawer: Drawer(
      //   child: AdminDrawer(),
      // ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [


                  //  AdminAd_Sliderscreen(), -> Carousel Slider here


                    SizedBox(height: 20,),



                    Text(
                      "News",
                      style: GoogleFonts.prompt(
                        fontSize: 18,
                        color: Colors.blueGrey.shade900,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    News_Container(),



                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Select Category",
                      style: GoogleFonts.prompt(
                          fontSize: 18, color: Colors.blueGrey.shade900),
                    ),
                    // Carousel(),
                    SizedBox(
                      height: 10,
                    ),


                    Admin_CatagoryimageButton(),



                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Other Category",
                      style: GoogleFonts.prompt(
                          fontSize: 18, color: Colors.blueGrey.shade900),
                    ),
                    SizedBox(
                      height: 10,
                    ),


                 //   Public_Tourist_Local_Display_Container2(),
                    Text(
                      "Services",
                      style: GoogleFonts.prompt(
                          fontSize: 18, color: Colors.blueGrey.shade900),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Service_Container(),
                    SizedBox(height: 20,),


                    Text(
                      "Events",
                      style: GoogleFonts.prompt(
                          fontSize: 18, color: Colors.blueGrey.shade900),
                    ),


                  //  AdminEventDisplay(),


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
