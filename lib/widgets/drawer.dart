import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final imageUrl =
      "https://th.bing.com/th/id/R.c7223f12f67d6c4466423462bab8cb3c?rik=3ynYHBorCYxNsQ&riu=http%3a%2f%2fdonpk.com%2fwp-content%2fuploads%2f2016%2f04%2fBeautiful_nature_3d_wallpapers_for-desktop_brackgrounds05-1024x768.jpg&ehk=LSfc8rKQ0wvkHdgmV3Ye0x9ssiJoYBDznUAHGERIciw%3d&risl=&pid=ImgRaw&r=0";

  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //used container because box decoraion was not applying to list view
      child: Container(
        decoration: const BoxDecoration(color: Colors.deepPurple),
        // To contain items which can be scrolled, just like scroll view in java
        // ListView.builder(itemBuilder: itemBuilder), its something like recyclerview
        child: ListView(
          children: [
            //different components of drawer
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: const Text("Muhammad Huzefa Abbasi"),
                  accountEmail: const Text("huzefaabbasi6@gmail.com"),
                  currentAccountPicture:
                      CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
                )),
            // used to make items
            const ListTile(
              //to create on click
              // onTap: ,
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.3,
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.3,
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
