//d33da00046a14d729f3c5f7acafc527c
import "dart:convert";

import "package:http/http.dart" as https;


class ForYouModel {
  String? title;
  String? image;
  String? name;

  ForYouModel({required this.name, required this.title, required this.image});

  factory ForYouModel.fromJson(Map<String, dynamic> json) {
    return ForYouModel(
        name: json["source"]["name"], title: json["title"], image: json["urlToImage"]);
  }
  
}

Future<List<ForYouModel>> foryouApi(String url) async {
  final response =await https.get(Uri.parse(
      url));
  if(response.statusCode == 200){
    final Map<String,dynamic> data = jsonDecode(response.body);
     if (data.containsKey('articles')) {
      List<dynamic> articles = data['articles'];
      return articles.map((e) => ForYouModel.fromJson(e)).toList();
    } else {
      throw Exception("No 'articles' key in the response.");
    }
  }
  else{
    throw Exception("Not working");
  }
  
}
