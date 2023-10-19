import "package:flutter/material.dart";
import "package:newsapp/MainScreen/comp/quick_read_Comp.dart";
import "package:newsapp/MainScreen/model/quickRead_model.dart";

const apiKey = "14d9967d42824234bafe14f5e12a5680";

class QuickRead extends StatefulWidget {
  const QuickRead({super.key});

  @override
  State<QuickRead> createState() => _QuickReadState();
}

class _QuickReadState extends State<QuickRead> {
  late Future<List<QuickReadModel>> quickReadModel;
  PageController _pageController = PageController();
  int currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quickReadModel =
        quickApi("https://newsapi.org/v2/everything?q=tech&apiKey=$apiKey");

    _pageController.addListener(() {
      if (_pageController.page == _pageController.page?.ceilToDouble()) {
        setState(() {
          currentPage = _pageController.page!.toInt();
        });
      }
      if (currentPage == validImage.length - 1) {
        fetchMoreData();
      }
    });
  }

  Future<void> fetchMoreData() async {
    final newData = await quickApi(
        "https://newsapi.org/v2/everything?q=keyword&apiKey=$apiKey");

    setState(() {
      validImage.add(newData);
    });
  }

  List<QuickReadModel> filterValidImages(List<QuickReadModel> models) {
    return models.where((model) => isValidImageUrl(model.image)).toList();
  }

  bool isValidImageUrl(String? imageUrl) {
    return imageUrl != null &&
        imageUrl.startsWith('https://') &&
        (imageUrl.endsWith(".jpg") ||
            imageUrl.endsWith(".jpeg") ||
            imageUrl.endsWith(".JPEG") ||
            imageUrl.endsWith(".JPG"));
  }

  List validImage = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: quickReadModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final newSearch = snapshot.data!;
                  validImage = filterValidImages(newSearch);

                  return Expanded(
                    child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      controller: _pageController,
                      itemCount: validImage.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            QuickComp(
                                image: validImage[index].image!,
                                title: validImage[index].title!,
                                name: validImage[index].name!,
                                content: validImage[index].content!)
                          ],
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: CircularProgressIndicator(
                      color: Colors.indigo,
                    ),
                  ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
