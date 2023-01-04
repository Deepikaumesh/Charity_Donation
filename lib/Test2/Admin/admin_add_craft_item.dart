import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Admin_add_craft_item extends StatefulWidget {
  @override
  _Admin_add_craft_itemState createState() => _Admin_add_craft_itemState();
}

class _Admin_add_craft_itemState extends State<Admin_add_craft_item> {
  var _image;
  final picker = ImagePicker();
  TextEditingController craft_id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future choose_image_gallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this._image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future choose_image_camera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this._image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future uploadImage() async {
    final uri = Uri.parse(
        "http://192.168.29.64/MySampleApp/Charity_Hope/Admin_add_craft_item.php");
    // "http://192.168.29.64/MySampleApp/Scanner_App/Merchant/Add_Product_to_db.php");
    var request = http.MultipartRequest('POST', uri);
    request.fields['price'] = price.text;
    request.fields['craft_id'] = craft_id.text;
    request.fields['name'] = name.text;
    request.fields['description'] = description.text;
    var pic = await http.MultipartFile.fromPath("image", _image.path);
    request.files.add(pic);
    var response = await request.send();
    print(response);

    if (response.statusCode == 200) {
      print('Image Uploded');
      price.clear();
      name.clear();
      //  productqty.clear();
      craft_id.clear();
      description.clear();

      final snackBar = await SnackBar(
        content: const Text('craft Added Successfully!'),
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
      print('Image Not Uploded');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add craft shop item",
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
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(40, 120, 40, 20),
                child: TextFormField(
                  controller: craft_id,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "enter craft id",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: TextFormField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "enter craft name",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextFormField(
                  controller: price,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Enter price",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: description,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "enter craft description",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Choose Image",
                    style: GoogleFonts.hindVadodara(
                      fontSize: 20,
                      color: Colors.cyan,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.photo_outlined,
                      size: 35,
                      color: Colors.cyan,
                    ),
                    onPressed: () {
                      choose_image_gallery();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      size: 35,
                      color: Colors.cyan,
                    ),
                    onPressed: () {
                      choose_image_camera();
                    },
                  ),
                ],
              ),
              Center(
                child: Container(
                    height: 100,
                    width: 200,
                    //decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),  color: Colors.grey,
                    //),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: _image != null
                          ? Image.file(
                              _image,
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: Text(
                              "No image selected",
                              style: GoogleFonts.hindVadodara(
                                  fontSize: 13, color: Colors.red.shade900),
                            )),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.pink.shade200,
                  padding: EdgeInsets.only(
                      left: 110, right: 110, top: 20, bottom: 20),
                ),
                onPressed: () {
                  setState(() {});
                  uploadImage();
                },
                child: Text('Submit'),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
