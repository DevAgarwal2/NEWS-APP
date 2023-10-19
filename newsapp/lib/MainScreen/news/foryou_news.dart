import "package:flutter/material.dart";
import "package:newsapp/MainScreen/comp/list_comp.dart";
import "package:newsapp/MainScreen/model/api_model.dart";

class ForYou extends StatefulWidget {
  String url;
  ForYou({super.key, required this.url});

  @override
  State<ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  late Future<List<ForYouModel>> forYouModel;
  late ForYouModel forYouModel2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forYouModel = foryouApi(widget.url);
    
  }

  List<ForYouModel> filterValidImages(List<ForYouModel> models) {
    return models.where((model) => isValidImageUrl(model.image)).toList();
  }
Future<void> refresh(){
  return Future.delayed(Duration(seconds: 2));
}
  bool isValidImageUrl(String? imageUrl) {
    return imageUrl != null &&
        imageUrl.startsWith('https://') &&
        (imageUrl.endsWith(".jpg") || imageUrl.endsWith(".jpeg")  || imageUrl.endsWith(".JPEG") ||imageUrl.endsWith(".JPG"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
          child: Column(
        children: [
          FutureBuilder(
            future: forYouModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final newSearch = snapshot.data!;
                final validImage = filterValidImages(newSearch);
                return Expanded(
                  child: RefreshIndicator(
                    color: Colors.indigo,
                    triggerMode: RefreshIndicatorTriggerMode.anywhere,
                    onRefresh:() => refresh(),
                    child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: validImage.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListComp(
                            name: validImage[index].name.toString(),
                            title: validImage[index].title.toString(),
                            image: validImage[index].image.toString(),
                            );
                      },
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 250),
                child: CircularProgressIndicator(),
              ));
            },
          )
        ],
      )),
    );
  }
}
