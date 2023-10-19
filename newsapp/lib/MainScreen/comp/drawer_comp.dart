import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:newsapp/MainScreen/comp/profile_comp.dart";
import "package:newsapp/MainScreen/pages/bookmark.dart";
import "package:newsapp/MainScreen/pages/profile.dart";
import "package:newsapp/MainScreen/pages/quick_read.dart";
import "package:newsapp/MainScreen/pages/search_page.dart";
import "package:newsapp/introScreen/Screen/login_option_screen.dart";

class DrawerComp extends StatefulWidget {
  DrawerComp({super.key});

  @override
  State<DrawerComp> createState() => _DrawerCompState();
}

class _DrawerCompState extends State<DrawerComp> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(62),
                  child: Image.network(
                    currentUser.photoURL!,
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          Row(
            children: [
              SizedBox(width: 20,),
              Text(currentUser.email.toString()),
            ],
          ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: Colors.grey.shade400,
              height: 1,
              thickness: 1,
            ),
            SizedBox(
              height: 40,
            ),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.home,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.search,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.person_sharp,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 205,
            ),
            Divider(color: Colors.grey.shade400,height: 1,thickness: 1,),
            SizedBox(height: 20,),
            Material(
              child: InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  GoogleSignIn().signOut();
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.logout_rounded,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "LogOut",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
