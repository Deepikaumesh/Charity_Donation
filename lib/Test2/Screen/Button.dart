import 'package:flutter/material.dart';

final Custom_Button =ElevatedButton(
  style: ElevatedButton.styleFrom(
    shape: StadiumBorder(),
    backgroundColor: Colors.pink.shade200,
    padding: EdgeInsets.only(
        left: 110, right: 110, top: 20, bottom: 20),
  ),
  onPressed: () {
    }, child: Text("Submit"),


);

