import 'package:flutter/material.dart';

class ProfileComp extends StatelessWidget {
  ProfileComp(
      {super.key,
      required this.name,
      required this.name2,
      this.icon
      });
  String name;
  String name2;
  IconData? icon;
 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: EdgeInsets.only(top: 1, left: 20, bottom: 5, right: 20),
        title: Text(
          name,
          style: TextStyle(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            name2,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
       
      ),
    );
  }
}
