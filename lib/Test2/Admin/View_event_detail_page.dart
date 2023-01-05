import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        children:[ Container(
                // color: Colors.red.shade50,
                height: MediaQuery.of(context).size.height,

                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/images/ev1.jpg",
                  height: 200,
                  width: 150,
                  fit: BoxFit.fitHeight,
                ),),
          Padding(
            padding: EdgeInsets.only(top: 300,left: 20,right: 20),
            child: Container(
              height: 400,
              width: 350,
              decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(70),topLeft: Radius.circular(70))
              ),


            ),
          ),
          Padding(padding: EdgeInsets.only(top: 730,left: 200),
          child:Container(
            height: 60,
            width: 170,
            decoration: BoxDecoration(
              color: Colors.pink.shade300,
              borderRadius: BorderRadius.circular(30)
            ),
           
            child: TextButton(onPressed: (){},
              child: Text("Add event",style: TextStyle(fontSize: 20,color: Colors.white),),),
          )
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
