import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Add_event.dart';
import 'View_events.dart';

class View_Event_Detail_Page extends StatefulWidget {
  final event_data_model data_event;

  const View_Event_Detail_Page({required this.data_event});

  @override
  _View_Event_Detail_PageState createState() => _View_Event_Detail_PageState();
}

class _View_Event_Detail_PageState extends State<View_Event_Detail_Page> {
  submit() async {
    final response = await http.post(
        Uri.parse(
            "https://anthracitic-pecks.000webhostapp.com/scan_copy/Customer/CartDelete.php"),
        body: {
          "id": widget.data_event.id.toString(),
          "name": widget.data_event.name.toString(),
          "event_date": widget.data_event.event_date.toString(),
          "event_time": widget.data_event.event_time.toString(),
          "description": widget.data_event.description.toString(),
        });
  }

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
                "assets/images/e4.png",
                height: 200,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 130, left: 100, right: 100),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              margin: EdgeInsets.all(20),
              height: 50,
              width: 300,
              //color: Colors.white,
              child: Text(
                "Events",
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
                  color: Colors.red.shade300,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(widget.data_event.name,
                      style: GoogleFonts.prompt(color: Colors.white,fontSize: 25)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.data_event.event_date,
                        style: GoogleFonts.prompt(color: Colors.white),
                      ),
                      Text(widget.data_event.event_time,
                          style: GoogleFonts.prompt(color: Colors.white))
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                      widget.data_event.description,style: GoogleFonts.prompt(color: Colors.white,),
                  textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 755, left: 320),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Hope_Admin_event_registration()));
                },
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add,
                  color: Colors.red.shade800,
                ),
              )
              // Container(
              //   height: 60,
              //   width: 170,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(30)
              //   ),
              //
              //   child: TextButton(onPressed: (){},
              //     child: Text("Add event",style: TextStyle(fontSize: 20,),),),
              // )
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     shape: StadiumBorder(),
              //     backgroundColor: Colors.pink.shade200,
              //
              //   ),
              //   onPressed: () {
              //     }, child: Container(
              // //color: Colors.red,
              //   padding: EdgeInsets.only(top: 15,left: 30,right: 30,bottom: 15),
              //     height: 65,
              //     width: 200,
              //     child: Text("Add event",style: TextStyle(fontSize: 25),)),
              //
              //
              // ),
              )
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
