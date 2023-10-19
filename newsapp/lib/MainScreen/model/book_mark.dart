import 'package:cloud_firestore/cloud_firestore.dart';

class BookmarkModel{
  final CollectionReference bookmarks = FirebaseFirestore.instance.collection("bookmark");

  Future<void> addBookmark(String title,String name,String image){
    return bookmarks.add({
      "title":title,
      "name":name,
      "image":image,
      "timestamp":Timestamp.now()
    });

  }
  Stream<QuerySnapshot> getBookmark(){
    final noteStream = bookmarks.orderBy("timestamp",descending: true).snapshots();
    return noteStream;

  }
  Future<void> deleteBookmark(String docId){
    return bookmarks.doc(docId).delete();
  }
}