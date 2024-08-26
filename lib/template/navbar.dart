

import 'package:flutter/material.dart';


class Navbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
      title: Container(
        // color: Colors.amber,
        // height: 300,
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        child: Image.asset(
                          "images/icons/aagu.png",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      // Text(
                      //   "data",
                      //   style: TextStyle(color: Colors.black, fontSize: 5),
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
