import "package:flutter/material.dart";
import "package:newsapp/MainScreen/comp/list_comp.dart";
import "package:newsapp/MainScreen/comp/text_field.dart";
import "package:newsapp/MainScreen/model/api_model.dart";
import "package:speech_to_text/speech_to_text.dart" as stt;
const apikey = "14d9967d42824234bafe14f5e12a5680";

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textEditingController = TextEditingController();
   stt.SpeechToText speech = stt.SpeechToText();
  
  bool isWorking = false;
  String sentence = '';

  late Future<List<ForYouModel>> forYouModel;
  late ForYouModel forYouModel2;

  String searchText = '';
  @override
  void initState() {
    super.initState();
    startListening();

    forYouModel =
        foryouApi("https://newsapi.org/v2/everything?q=keyword&apiKey=$apikey");
  }

 void startListening()async {
  if (!isWorking) {
    if (speech.isAvailable) {
      await  speech.initialize().then((result) {
        if (result) {
          speech.listen(
            onResult: (result) {
              setState(() {
                searchText = result.recognizedWords;
                print(result.recognizedWords);
                updateSearch();
                isWorking=true;
              });
            },
            
            
          );

         
        } else {
          print("Failed to initialize speech recognition.");
        }
      });
    } else {
      print("Speech recognition is not available.");
    }
  }
}

void stopListening() async{
  if (isWorking) {
    await speech.stop();
    setState(() {
      isWorking = false;
    });
  }
}







  Future<void> updateSearch() async {
    final searchQuery = textEditingController.text;
    setState(() {
      searchText = searchQuery;
      forYouModel = foryouApi(
          "https://newsapi.org/v2/everything?q=${searchQuery}&apiKey=$apikey");
    });
  }

  List<ForYouModel> filterValidImages(List<ForYouModel> models) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text(
          "Search",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          TextComp(
            ontap2: () {
              if(isWorking){
                stopListening();
              }
              else{
                startListening();              }
            },
            icon1: Icons.search,
            icon2: isWorking ?Icons.mic_off:Icons.mic,
            text: "Enter the news",
            textEditingController: textEditingController,
            ontap: (p0) {
              setState(() {
                updateSearch();
                print(searchText);
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder(
              future: forYouModel,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  final newSearch = snapshot.data!
                      .where((element) => element.title!
                          .toLowerCase()
                          .contains(searchText.toLowerCase()))
                      .toList();
                  final validImage = filterValidImages(newSearch);
                  return ListView.builder(
                    itemCount: validImage.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListComp(
                        name: validImage[index].name.toString(),
                        title: validImage[index].title.toString(),
                        image: validImage[index].image.toString(),
                      );
                    },
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
            ),
          )
        ],
      )),
    );
  }
}
