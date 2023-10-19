import "package:flutter/material.dart";

class myButton extends StatelessWidget {
  final String text;
  final Color color;
  Function()? ontap;
  myButton(
      {super.key,
      required this.text,
      required this.color,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        hoverColor: Colors.white,
        onTap: ontap,
        child: Container(
          width: 290,
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
