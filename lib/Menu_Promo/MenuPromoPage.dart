import 'package:flutter/material.dart';
import 'package:flutter_aag4u/Menu_Promo/promoPage.dart';

class MenuPromoPage extends StatefulWidget {
  const MenuPromoPage({super.key});

  @override
  State<MenuPromoPage> createState() => _MenuPromoPageState();
}

class _MenuPromoPageState extends State<MenuPromoPage> {
  List<String> items = List.generate(10, (index) => "Item ${index + 1}");

// Fungsi untuk merefresh data
  Future<void> _refreshData() async {
    // Simulasi delay untuk meniru proses refresh
    await Future.delayed(Duration(seconds: 2));

    // Setelah proses refresh, perbarui data
    setState(() {
      items = List.generate(10, (index) => "Refreshed Item ${index + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   // appBar: Navbar(),

      //   title: Container(
      //     // color: Colors.amber,
      //     width: 250,
      //     // height: 300,
      //     child: Column(
      //       children: [
      //         Container(
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Column(
      //                 children: [
      //                   Container(
      //                     child: Image.asset(
      //                       "images/icons/aagu.png",
      //                       height: 100,
      //                       width: 100,
      //                     ),
      //                   ),
      //                   // Text(
      //                   //   "data",
      //                   //   style: TextStyle(color: Colors.black, fontSize: 5),
      //                   // )
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          "Promo",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF233d63),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        child: promoPage(),
                      )
                    ],
                )],
              )
          ],
        ),
      ),
    );
  }
}

// class TsClip2 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();

//     // Start the path at the top-left corner
//     path.moveTo(0, 0);

//     // Variables to control wave creation
//     var curXPos = 0.0;
//     var curYPos = 0.0;
//     var increment = size.width / 20;

//     // Create the arc pattern along the top edge, with the wave going upwards
//     while (curXPos < size.width) {
//       curXPos += increment;
//       path.arcToPoint(
//         Offset(curXPos, curYPos == 0 ? 20 : 0), // Move the wave upwards
//         radius: Radius.circular(5), // Adjust the radius for smoother arcs
//         clockwise: curYPos == 0,
//       );
//       curYPos =
//           curYPos == 0 ? 10 : 0; // Alternate Y position to create the wave
//     }

//     // Draw the path down the right side, across the bottom, and back up the left side
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// class TsClip3 extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     // Start the path at the top-left corner
//     path.moveTo(0, 0);

//     // Initialize the current positions at the top-left corner
//     var curXPos = 0.0;
//     var curYPos = 0.0;

//     // Set the wave increment based on the width
//     var increment = size.width / 30;

//     // Create the wave pattern along the top edge
//     while (curXPos < size.width) {
//       curXPos += increment;
//       curYPos =
//           curYPos == 0 ? 10 : 0; // Invert the wave pattern for the top edge
//       path.lineTo(curXPos, curYPos);
//     }

//     // Draw the path down the right side, across the bottom, and back up the left side
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close(); // Close the path

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
