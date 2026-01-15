import 'package:flutter/material.dart';

class Lainnyawidget extends StatefulWidget {
  const Lainnyawidget({super.key});

  @override
  State<Lainnyawidget> createState() => _LainnyawidgetState();
}

class _LainnyawidgetState extends State<Lainnyawidget> {
  // Flag to control the image scaling when the modal is opened
  bool isModalOpen = false;

  void _showAnimatedModal() {
    setState(() {
      isModalOpen = true; // Set to true when modal is opened
    });

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration:
          Duration(milliseconds: 300), // Animation duration for modal
      pageBuilder: (context, animation1, animation2) {
        return Align(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "More Options",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text("Here are more options available."),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the modal
                      setState(() {
                        isModalOpen = false; // Reset when modal is closed
                      });
                    },
                    child: Text("Option 1"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the modal
                      setState(() {
                        isModalOpen = false; // Reset when modal is closed
                      });
                    },
                    child: Text("Option 2"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        return ScaleTransition(
          scale: Tween<double>(begin: 1, end: 0.9).animate(curvedAnimation),
          child: FadeTransition(
            opacity: curvedAnimation,
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: _showAnimatedModal,
            child: Column(
              children: [
                // Apply scale animation to the image
                AnimatedScale(
                  scale: isModalOpen
                      ? 0.8
                      : 1, // Scale down the image when modal is opened
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      "images/icons/lainnya.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Lainnya",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class Lainnyawidget extends StatefulWidget {
//   const Lainnyawidget({super.key});

//   @override
//   State<Lainnyawidget> createState() => _LainnyawidgetState();
// }

// class _LainnyawidgetState extends State<Lainnyawidget> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           Column(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     width: 50,
//                     height: 50,
//                     decoration: BoxDecoration(
//                         // color: Color.fromARGB(255, 10, 71, 212),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: 
//                     GestureDetector(
//                       onTap: () {
//                         showModalBottomSheet(
//                             context: context,
//                             shape: const RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(30),
//                             )),
//                             builder: (BuildContext context) =>
//                                 DraggableScrollableSheet(
//                                     expand: false,
//                                     builder: (BuildContext context,
//                                             ScrollController
//                                                 scrollController) =>
//                                         SingleChildScrollView(
//                                           child: Center(
//                                             child: Image.asset(
//                                               "images/icons/lainnya.png",
//                                               height: 50,
//                                               width: 50,
//                                             ),
//                                           ),
//                                         )
//                                     //          {
//                                     //   return  Container(
//                                     //     height:
//                                     //         200.0,
//                                     //     color: Colors
//                                     //         .white,
//                                     //     child:
//                                     //         Center(
//                                     //       child:
//                                     //           Column(
//                                     //         mainAxisAlignment:
//                                     //             MainAxisAlignment.center,
//                                     //         children: <Widget>[
//                                     //           Text(
//                                     //             'This is a Modal Bottom Sheet',
//                                     //             style:
//                                     //                 TextStyle(fontSize: 18.0),
//                                     //           ),
//                                     //           SizedBox(
//                                     //               height: 20.0),
//                                     //           ElevatedButton(
//                                     //             onPressed:
//                                     //                 () {
//                                     //               Navigator.pop(context);
//                                     //             },
//                                     //             child:
//                                     //                 Text('Close'),
//                                     //           ),
//                                     //         ],
//                                     //       ),
//                                     //     ),
//                                     //   );
//                                     // },
//                                     )

//                             //     {
//                             //   return
//                             // Container(
//                             //     height: 200.0,
//                             //     color: Colors.white,
//                             //     child: Center(
//                             //       child: Column(
//                             //         mainAxisAlignment:
//                             //             MainAxisAlignment
//                             //                 .center,
//                             //         children: <Widget>[
//                             //           Text(
//                             //             'This is a Modal Bottom Sheet',
//                             //             style: TextStyle(
//                             //                 fontSize:
//                             //                     18.0),
//                             //           ),
//                             //           SizedBox(
//                             //               height:
//                             //                   20.0),
//                             //           ElevatedButton(
//                             //             onPressed:
//                             //                 () {
//                             //               Navigator.pop(
//                             //                   context);
//                             //             },
//                             //             child: Text(
//                             //                 'Close'),
//                             //           ),
//                             //         ],
//                             //       ),
//                             //     ),
//                             //   );
//                             // },
//                             );
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             // color: Colors.amber,
//                             // height: 50,
//                             // width: 50,
//                             child: Image.asset(
//                               "images/icons/lainnya.png",
//                               // width: 50,
//                               // height: 50,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                           // const SizedBox(height: 5,),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                       child: Text("Lainnya",
//                           style: TextStyle(
//                             fontSize: 11,
//                           )))
//                 ],
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
