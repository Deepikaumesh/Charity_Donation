import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Admin/Splashscreen_Admin.dart';
import '../User/Splashscreen_User_.dart';



class Hope_Main_Way extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 300, horizontal: 60),
            child: Container(

              height: 200,
              width: 250,
              decoration: BoxDecoration(
               //  color: Colors.green,

                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/orphans.jpg',
                    ),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 315, horizontal: 170),
              child: Text("Hope",style: GoogleFonts.dancingScript(fontSize: 30,color: Colors.pink.shade300))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 25),
                  child: Column(
                    children: [
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      padding:
                      const EdgeInsets.only(top: 25, left: 24, right: 24),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Colors.pink.shade300,
                          padding: EdgeInsets.only(
                              left: 40, right: 40, top: 15, bottom: 15),
                        ),

                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_Splashscreen()));
                        },


                        //color: Colors.indigo,
                        child: Text(
                          'Admin',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      padding:
                      const EdgeInsets.only(top: 25, left: 24, right: 24),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Colors.pink.shade300,
                          padding: EdgeInsets.only(
                              left: 40, right: 40, top: 15, bottom: 15),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Hope_User_Splash()));
                        },
                        child: Text(
                          'User',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


















// import 'package:chari/Test2/Admin/Dashboard.dart';
// import 'package:flutter/material.dart';
//
// import '../Admin/Hope_Admin_Splashscreen.dart';
// import '../User/Splashscreen_User_.dart';
//
//
//
//
// class Hope_Main_Way extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//         body: Center(
//           child: Column(
//             children: [
//               SizedBox(height: 400,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   GestureDetector(
//                     onTap: (){
//                       //   check_Hope_Admin_LogedIn();
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin_Splashscreen()));
//                   //    Navigator.push(context, MaterialPageRoute(builder: (context)=>Hope_Admin_Dashboard()));
//
//
//                     },
//                     child: Column(
//                       children: [
//                         Container(
//                           child: Image.asset(
//                             "assets/images/user.png",
//                             height: 140,
//                             width: 140,
//                           ),
//                         ),
//                         Text("Admin")
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: (){
//                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Hope_User_Splash()));
//                     },
//                     child: Column(
//                       children: [
//                         Container(
//                           child: Image.asset(
//                             "assets/images/user.png",
//                             height: 140,
//                             width: 140,
//                           ),
//                         ),
//                         Text("User")
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//            //    GestureDetector(
//            //      onTap: (){
//            // //       Navigator.push(context, MaterialPageRoute(builder: (context)=>gust_Splash()));
//            //      },
//            //      child: Column(
//            //        children: [
//            //          Container(
//            //            child: Image.asset(
//            //              "assets/images/user.png",
//            //              height: 140,
//            //              width: 140,
//            //            ),
//            //          ),
//            //          Text("Guest")
//            //        ],
//            //      ),
//            //    ),
//             ],
//           ),
//         )
//     );
//   }
// }
