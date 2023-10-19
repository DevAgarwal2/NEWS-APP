import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:newsapp/MainScreen/comp/list_comp.dart";
import "package:newsapp/MainScreen/model/book_mark.dart";

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  BookmarkModel bookmarkModel = BookmarkModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: StreamBuilder<QuerySnapshot>(
        stream: bookmarkModel.getBookmark(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List data = snapshot.data!.docs;
            return SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        "BOOKMARK",
                        style: TextStyle(fontSize: 23),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                 
                  
                  Divider(
                    color: Colors.grey.shade400,
                    height: 1,
                    thickness: 1,
                  ),
                   Container(
                    padding: EdgeInsets.all(12),
                    color: Colors.white,
                     child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Articles",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "(${data.length})",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      ],
                                     ),
                   ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot = data[index];
                        String docId = documentSnapshot.id;
                        Map<String, dynamic> getData =
                            documentSnapshot.data() as Map<String, dynamic>;
                        String title = getData["title"];
                        String name = getData["name"];
                        String image = getData["image"];
                        return Slidable(
                            endActionPane:
                                ActionPane(motion: StretchMotion(), children: [
                              SlidableAction(
                                onPressed: (context) {
                                  bookmarkModel.deleteBookmark(docId);
                                },
                                icon: Icons.delete,
                                backgroundColor: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                                
                              )
                            ]),
                            child: ListComp(
                                name: name, title: title, image: image));
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
