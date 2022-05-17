import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  final String imageUrl =
      "https://yt3.ggpht.com/ytc/AKedOLStCRhXN6RXKSRdKunCivFFQ76fHsVLElmUK61LvA=s900-c-k-c0x00ffffff-no-rj";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        padding: EdgeInsets.zero,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Pawan Prajapati"),
                accountEmail: Text("ppawan100@gmail.com"),
                // currentAccountPicture: Image.network(imageUrl),
                currentAccountPicture:
                    CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email me",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
