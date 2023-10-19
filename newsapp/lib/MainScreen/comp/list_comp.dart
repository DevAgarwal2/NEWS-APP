import "package:flutter/material.dart";
import "package:newsapp/MainScreen/comp/button_comp.dart";
import "package:newsapp/MainScreen/model/api_model.dart";
import "package:newsapp/MainScreen/model/book_mark.dart";
import "package:share_plus/share_plus.dart";
import "package:social_share/social_share.dart";

class ListComp extends StatefulWidget {
  String name;
  String title;
  String image;

  ListComp(
      {super.key,
      required this.name,
      required this.title,
      required this.image});

  @override
  State<ListComp> createState() => _ListCompState();
}

class _ListCompState extends State<ListComp> {
  BookmarkModel bookmarkModel = BookmarkModel();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(1),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(5),
            title: Text(widget.title),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                widget.name,
                style: TextStyle(
                    color: Colors.grey.shade600, fontWeight: FontWeight.w600),
              ),
            ),
            trailing: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.image,
                  height: 150,
                  width: 100,
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Material(
                  child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12))),
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 200,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 25,
                                  ),
                                  ButtonComp(
                                    title: "Bookmark",
                                    ontap: () {
                                      bookmarkModel.addBookmark(widget.title,
                                          widget.name, widget.image);
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Bookmark Added")));
                                    },
                                    icon: Icons.bookmark_border,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  ButtonComp(
                                    title: "Share",
                                    ontap: () {
                                      Share.share("${widget.title}");
                                    },
                                    icon: Icons.share,
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    height: 1,
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Material(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                              width: double.maxFinite,
                                              child: Center(
                                                child: Text(
                                                  "Cancel",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ))))
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.more_horiz_rounded,
                      )))),
        ],
      ),
    );
  }
}
