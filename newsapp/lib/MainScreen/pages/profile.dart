import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:newsapp/MainScreen/comp/profile_comp.dart";

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey.shade800,
              )),
          title: Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Text(
              "PROFILE",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
            ),
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 30,),
             ClipRRect(
              borderRadius: BorderRadius.circular(62),
               child: Image.network(
                 
                 currentUser.photoURL!,
                 height: 150,
                 width: 150,
                 fit: BoxFit.fill,
               ),
             ),
            
            SizedBox(
              height: 30,
            ),
            ProfileComp(name: "Email", name2: currentUser.email.toString()),
            SizedBox(
              height: 15,
            ),
            ProfileComp(name: "Name", name2: currentUser.displayName!),
          ],
        )));
  }
}
