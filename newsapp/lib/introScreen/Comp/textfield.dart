import "package:flutter/material.dart";

class myTextField extends StatelessWidget {
  final String text;
  bool obstrueText;
  TextEditingController textEditingController;
  myTextField(
      {super.key,
      required this.text,
      required this.obstrueText,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30,right: 30),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: textEditingController,
        obscureText: obstrueText,
        decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            
          ),
          focusColor: Colors.black,
          focusedBorder: OutlineInputBorder()
          
          
        ),
      ),
    );
  }
}
