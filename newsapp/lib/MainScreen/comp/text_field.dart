import "package:flutter/material.dart";

class TextComp extends StatelessWidget {
  TextComp(
      {super.key,
      required this.icon1,
      required this.icon2,
      required this.text,
      required this.textEditingController,this.ontap,required this.ontap2});
  IconData icon1;
  IconData icon2;
  String text;
  TextEditingController textEditingController;
  Function(String)? ontap;
  Function()? ontap2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: TextField(
        onChanged: ontap,
        controller: textEditingController,
        decoration: InputDecoration(
            prefixIcon: Material(child: InkWell(onTap: (){},child: Icon(icon1))),
            suffixIcon: Material(child: InkWell(onTap: ontap2,child: Icon(icon2))),
            hintText: text,
            border: InputBorder.none),
      ),
    );
  }
}
