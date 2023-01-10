import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Add_Craft_Item.dart';
import 'View_Craft.dart';

class View_craft_shop_Detail_Page extends StatefulWidget {
  final craft_model data_craft;

  const View_craft_shop_Detail_Page({required this.data_craft});

  @override
  _View_craft_shop_Detail_PageState createState() =>
      _View_craft_shop_Detail_PageState();
}

class _View_craft_shop_Detail_PageState
    extends State<View_craft_shop_Detail_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 30,
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue.shade100,
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 50,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                  //border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow,
                  image: DecorationImage(
                      image: NetworkImage(widget.data_craft.image),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            top: 400,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(20),
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.data_craft.name,
                          style: GoogleFonts.prompt(
                              color: Colors.white, fontSize: 20)),
                      Text("\$" + widget.data_craft.price,
                          style: GoogleFonts.prompt(
                              color: Colors.white, fontSize: 20)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.data_craft.description,
                    style: (TextStyle(fontSize: 15)),
                    // style: GoogleFonts.bokor(
                    //     color: Colors.blueGrey, fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 700,
            right: 40,
            left: 40,
            child: Container(
              height: 80,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.pink.shade300,
                  padding:
                      EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 15),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Admin_add_craft_item()));
                },
                child: Text(
                  'Add Craft',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
