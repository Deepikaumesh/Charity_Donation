import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Craft_Shop_detail_page_User.dart';



class craft_model {
  final String id;
  final String name;
  final String craft_id;
  final String price;
  final String description;
  final String image;

  craft_model({
    required this.id,
    required this.name,
    required this.craft_id,
    required this.price,
    required this.description,
    required this.image,
  });
}


class User_View_Craftitem_ extends StatefulWidget {
  const User_View_Craftitem_({Key? key}) : super(key: key);

  @override
  _User_View_Craftitem_State createState() => _User_View_Craftitem_State();
}

class _User_View_Craftitem_State extends State<User_View_Craftitem_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.shade300,
        title: Text("Craft Shop"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder(
              future: getRequest(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                if (snapshot.data == null || snapshot.data == false) {
                  return Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.red.shade900,
                            strokeWidth: 5,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Loading...",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Flexible(
                    child: Column(
                      children: [
                        Flexible(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (ctx, index) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 2),
                                        child: Card(


                                          color: Colors.cyan.shade50,
                                          //shadowColor: Colors.red,
                                          elevation: 8,
                                         clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),

                                          child: Container(
                                            // color: Colors.red,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height /
                                                8.5,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                1.2,
                                            //padding: EdgeInsets.fromLTRB(10, 15, 50, 15),
                                            child: ListTile(
                                              contentPadding: EdgeInsets.all(15.0),
                                              leading: Container(
                                                          height: 50,
                                                          width: 50,
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            border: Border.all(color: Colors.red.shade900),
                                                            image: DecorationImage(
                                                               image: NetworkImage(snapshot.data[index].image),
                                                             ),
                                                          ),
                                                        ),
                                              title: Text("Craft name:"+snapshot.data[index].name,
                                                          overflow: TextOverflow.ellipsis,
                                                          style:
                                                              GoogleFonts.lora(fontSize: 15, color: Colors.pink.shade700),
                                                        ),
                                              subtitle: Row(
                                                children:[
                                                  Text("Craft price:"+
                                                            snapshot.data[index].price,
                                                            overflow: TextOverflow.ellipsis,
                                                            style:
                                                                GoogleFonts.lora(fontSize: 15, color: Colors.pink.shade700),
                                                          ),

                                                  SizedBox(width: 10,),
                                                 Text("details"),
                                                  IconButton(onPressed: (){
                                                    Navigator.pushReplacement(context, 
                                                        MaterialPageRoute(builder:
                                                            (context)=>
                                                                User_View_craft_shop_Detail_Page(data_craft: snapshot.data[index],)));
                                                  }, icon: Icon(Icons.arrow_forward_ios_rounded)),

                                            ],  ),


                                            ),

                                          ),
                                        ),
                                        // child:  Card(
                                        //     elevation: 5,
                                        //     color: Colors.pink.shade50,
                                        //     margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                                        //     shape: RoundedRectangleBorder(
                                        //       borderRadius: BorderRadius.circular(20.0),
                                        //     ),
                                        //     child: ListTile(
                                        //         contentPadding: EdgeInsets.all(10.0),
                                        //         leading: Container(
                                        //           height: 100,
                                        //           width: 100,
                                        //           decoration: BoxDecoration(
                                        //             shape: BoxShape.circle,
                                        //             border: Border.all(color: Colors.red.shade900),
                                        //             image: DecorationImage(
                                        //                image: NetworkImage(snapshot.data[index].image),
                                        //              ),
                                        //           ),
                                        //         ),
                                        //         title: Text(snapshot.data[index].name,
                                        //           overflow: TextOverflow.ellipsis,
                                        //           style:
                                        //               GoogleFonts.lora(fontSize: 15, color: Colors.pink.shade700),
                                        //         ),
                                        //         subtitle: Text(
                                        //           snapshot.data[index].price,
                                        //           overflow: TextOverflow.ellipsis,
                                        //           style:
                                        //               GoogleFonts.lora(fontSize: 15, color: Colors.pink.shade700),
                                        //         ),
                                        //         onTap: () {})),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),

    );
  }

  Future<List<craft_model>> getRequest() async {
    //replace your restFull API here.

    final response = await http.get(Uri.parse(
        "http://192.168.29.64/MySampleApp/Charity_Hope/Admin_craft_Display.php"
    ));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<craft_model> users = [];
    for (var singleUser in responseData) {
      craft_model user = craft_model(
        // productqty: singleUser["productqty"].toString(),

        name: singleUser["name"].toString(),
        id: singleUser["id"].toString(),
       craft_id:singleUser["craft_id"].toString(),
        price:singleUser["price"].toString(),
        description:singleUser["description"].toString(),
        image: singleUser["image"].toString(),
      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }
}
