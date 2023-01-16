import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import 'View_events_Admin.dart';







class Hope_Admin_Edit_event extends StatefulWidget {
  final event_data_model data_user;

  const Hope_Admin_Edit_event({required this.data_user});

  @override
  _Hope_Admin_Edit_eventState createState() => _Hope_Admin_Edit_eventState();
}

class _Hope_Admin_Edit_eventState extends State<Hope_Admin_Edit_event> {
  TextEditingController ename = TextEditingController();
  TextEditingController e_event_date = TextEditingController();
  TextEditingController e_event_time = TextEditingController();
  TextEditingController e_description = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  submit() async {
    final response = await http.post(
        Uri.parse(
            "http://$ip/MySampleApp/Charity_Hope/Admin_Edit_Event.php"),
        body: {
          "id": widget.data_user.id.toString(),
          "name": ename.text,
          "event_date": e_event_date.text,
          "event_time": e_event_time.text,
          "description": e_description.text,
        });
    if (response.statusCode == 200) {
      print('Image Uploded');
      ename.clear();
      e_event_date.clear();
      //  productqty.clear();
      e_event_time.clear();
      e_description.clear();

      final snackBar = await SnackBar(
        content: const Text('Event updated successfully!'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            //Navigator.pop(context);
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print("not");
      final snackBar = await SnackBar(
        content: const Text('Event updation failed!'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            //Navigator.pop(context);
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    setState(() {
    });

  }

  @override
  void initState() {
    ename = TextEditingController(text: widget.data_user.name);
    e_event_date = TextEditingController(text: widget.data_user.event_date);
    e_event_time = TextEditingController(text: widget.data_user.event_time);
    e_description = TextEditingController(text: widget.data_user.description);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Edit Event",
          style: GoogleFonts.prompt(color: Colors.pink.shade300),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded, color: Colors.pink.shade300,
            size: 35, // add custom icons also
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    child: TextFormField(
                      controller: ename,
                      decoration: InputDecoration(
                        labelText: "Enter event name",
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: TextFormField(
                      controller: e_event_date,
                      decoration: InputDecoration(
                        labelText: "Pick event date",
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal),
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    //  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: TextFormField(
                      controller: e_event_time,
                      decoration: InputDecoration(
                        labelText: "Enter event time",
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    //  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: TextFormField(
                      controller: e_description,
                      decoration: InputDecoration(
                        labelText: "Enter event description",
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),


            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.pink.shade200,
                padding: EdgeInsets.only(
                    left: 100, right: 100, top: 20, bottom: 20),
              ),
              onPressed: () {
                submit();
                ename.clear();
                e_event_date.clear();
                e_event_time.clear();
                e_description.clear();
              }, child: Text("Update",style: TextStyle(fontSize: 20),),


            ),



            ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
