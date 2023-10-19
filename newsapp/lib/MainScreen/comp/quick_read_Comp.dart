import "package:flutter/material.dart";

class QuickComp extends StatelessWidget {
  QuickComp(
      {super.key,
      required this.image,
      required this.title,
      required this.name,
      required this.content});
  String image;
  String title;
  String name;
  String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          children: [
            Image.network(
              image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 21),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
              child: Text(
                content,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("By",style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
                SizedBox(
                  width: 6,
                ),
                Text(
                  name,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
