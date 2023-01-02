import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Hope_Admin_Add_event.dart';
import 'Hope_Admin_Edit_event.dart';
import 'event_edit_main_page.dart';



class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage(
                    "assets/images/orphans.png",
                  ),
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Hope",
                    style: GoogleFonts.aclonica(
                      color: Colors.pink,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        //Now let's Add the button for the Menu
        //and let's copy that and modify it

        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Hope_Admin_event_registration()));
          },
          leading: Icon(
            Icons.add,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Add Events",
              style: GoogleFonts.prompt(
                fontSize: 15,
              )),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Hope_Admin_event_Display_edit_page()));
          },
          leading: Icon(
            Icons.mode_edit,
            color: Colors.blueGrey.shade900,
          ),
          title: Text(
            "Edit Events",
            style: GoogleFonts.prompt(fontSize: 15),
          ),
        ),

        ListTile(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => Business_Reg_Catagory()));
          },
          leading: Icon(
            Icons.delete,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Delete Events",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),
        //
        // ListTile(
        //   onTap: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => News_Reg()));
        //   },
        //   leading: Icon(
        //     Icons.newspaper_rounded,
        //     color: Colors.blueGrey.shade900,
        //   ),
        //   title: Text("",
        //       style: GoogleFonts.prompt(fontSize: 15)),
        // ),
        // ListTile(
        //   onTap: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => EventReg()));
        //   },
        //   leading: Icon(
        //     Icons.image,
        //     color: Colors.blueGrey.shade900,
        //   ),
        //   title: Text("Event Registration",
        //       style: GoogleFonts.prompt(fontSize: 15)),
        // ),
        //
        // ListTile(
        //   onTap: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => AdRegistration()));
        //   },
        //   leading: Icon(
        //     Icons.web_asset_sharp,
        //     color: Colors.blueGrey.shade900,
        //   ),
        //   title: Text("Advertaisement Registration",
        //       style: GoogleFonts.prompt(fontSize: 15)),
        // ),
        // ListTile(
        //   onTap: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => Listview()));
        //   },
        //   leading: Icon(
        //     Icons.web_asset_sharp,
        //     color: Colors.blueGrey.shade900,
        //   ),
        //   title: Text("Index Passing",
        //       style: GoogleFonts.prompt(fontSize: 15)),
        // ),

        //
        // ListTile(
        //   onTap: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => Listview2()));
        //   },
        //   leading: Icon(
        //     Icons.web_asset_sharp,
        //     color: Colors.blueGrey.shade900,
        //   ),
        //   title: Text("Index Passing Test2",
        //       style: GoogleFonts.prompt(fontSize: 15)),
        // ),
            ]),
    );
  }
}
