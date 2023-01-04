import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Hope_Admin_Add_event.dart';
import 'View_more_Page_food_bookings.dart';
import 'admin_add_craft_item.dart';
import 'admin_remove_craft_page.dart';
import 'event_delete_main_page.dart';
import 'event_edit_main_page.dart';
import 'food_bookings_cancel.dart';

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
                context,
                MaterialPageRoute(
                    builder: (context) => Hope_Admin_event_registration()));
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
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Hope_Admin_event_Display_edit_page()));
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Hope_Admin_event_Display_delete_page()));
          },
          leading: Icon(
            Icons.delete,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Delete Events", style: GoogleFonts.prompt(fontSize: 15)),
        ),
        //
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => food_bookings_cancel()));
          },
          leading: Icon(
            Icons.cancel,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Cancel food bookings",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Admin_add_craft_item()));
          },
          leading: Icon(
            Icons.shopping_basket,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Add craft item",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),
        //
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Admin_remove_Craftitem_page()));
          },
          leading: Icon(
            Icons.remove_circle_outline_rounded,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Remove craft item",
              style: GoogleFonts.prompt(fontSize: 15)),
        ),
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
