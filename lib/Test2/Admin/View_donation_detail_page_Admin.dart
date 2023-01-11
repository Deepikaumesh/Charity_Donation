
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Admin/View_donations_Admin.dart';



class View_Donation_Detail_Page extends StatefulWidget {
  final donation_model donation_data;

  const View_Donation_Detail_Page({required this.donation_data});

  @override
  _View_Donation_Detail_PageState createState() =>
      _View_Donation_Detail_PageState();
}

class _View_Donation_Detail_PageState extends State<View_Donation_Detail_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 400),
            child: Container(
              // color: Colors.red.shade50,
              height: MediaQuery.of(context).size.height,

              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/don1.jpg",
                height: 200,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 130, left: 100, right: 100),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              margin: EdgeInsets.all(20),
              height: 50,
              width: 300,
              //color: Colors.white,
              child: Text(
                "Donations",
                style: GoogleFonts.prompt(
                    fontSize: 25, color: Colors.red.shade800),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 400, left: 20, right: 20),
            child: Container(
              padding: EdgeInsets.all(20),
              height: 400,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.cyan.shade200,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Row(
                      children: [
                        Text("Name:",
                            style: GoogleFonts.prompt(
                                color: Colors.blueGrey, fontSize: 20)),
                        Text(widget.donation_data.name,
                            style: GoogleFonts.prompt(
                                color: Colors.blueGrey, fontSize: 20)),
                      ],
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Row(
                      children: [
                        Text("Amount:",
                            style: GoogleFonts.prompt(
                                color: Colors.blueGrey, fontSize: 20)),
                        Text(widget.donation_data.amount,
                            style: GoogleFonts.prompt(
                                color: Colors.blueGrey, fontSize: 20)),
                      ],
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Row(
                      children: [
                        Text("Phone:",
                            style: GoogleFonts.prompt(
                                color: Colors.blueGrey, fontSize: 20)),
                        Text(widget.donation_data.phone,
                            style: GoogleFonts.prompt(
                                color: Colors.blueGrey, fontSize: 20)),
                      ],
                    ),
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Row(
                      children: [
                        Text("Place:",
                            style: GoogleFonts.prompt(
                                color: Colors.blueGrey, fontSize: 20)),
                        Text(
                          widget.donation_data.place,
                          style: GoogleFonts.prompt(
                              color: Colors.blueGrey, fontSize: 20),
                        )
                      ],
                    ),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // )
    //   Column(
    //   children: [
    //     Container(
    //       // color: Colors.red.shade50,
    //       height: MediaQuery.of(context).size.height / 3,
    //       width: MediaQuery.of(context).size.width,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [
    //           ClipRRect(
    //             borderRadius: BorderRadius.circular(8.0),
    //             child: Image.asset(
    //               "assets/images/events.jpg",
    //               height: 200,
    //               width: 150,
    //               fit: BoxFit.contain,
    //             ),
    //           ),
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text("Event Name:" + widget.data_event.name),
    //               SizedBox(
    //                 height: 20,
    //               ),
    //               Text("Event Date:" + widget.data_event.event_date),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
