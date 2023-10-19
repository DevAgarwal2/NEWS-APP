import "dart:math";

import "package:flutter/material.dart";

class GoogleComp extends StatelessWidget {
  final String image;
  const GoogleComp({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      margin: EdgeInsets.only(left: 30,right: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade400)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset(image,width: 20,height: 20,),
        SizedBox(width: 10,),
        Text("Login With Google")
      ],)
    );
  }
}