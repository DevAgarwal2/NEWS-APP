import "package:flutter/material.dart";
import "package:newsapp/MainScreen/comp/drawer_comp.dart";
import "package:newsapp/MainScreen/news/foryou_news.dart";
import "package:newsapp/MainScreen/pages/profile.dart";
import "package:newsapp/MainScreen/pages/search_page.dart";

const String apikey = "14d9967d42824234bafe14f5e12a5680";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Tab> tabs = [
    Tab(
      child: Text("For You"),
    ),
    Tab(
      child: Text("World News"),
    ),
    Tab(
      child: Text("India News"),
    ),
    Tab(child: Text("Tech News")),
    Tab(child: Text("Startups")),
    Tab(
      child: Text("Stocks"),
    ),
    Tab(
      child: Text("Sports"),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        drawer: Drawer(
          child: DrawerComp(),
        ),
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade500,
          title: Center(child: Text('News App')),
          bottom: TabBar(
            isScrollable: true,
            indicatorWeight: 1,
            indicatorColor: Colors.white,
            tabs: tabs,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Icon(
                    Icons.person,
                    size: 30,
                  )),
            )
          ],
        ),
        body: TabBarView(
          children: [
            ForYou(
              url: "https://newsapi.org/v2/everything?q=world&apiKey=$apikey",
            ),
            ForYou(
                url:
                    "https://newsapi.org/v2/top-headlines?q=world&apiKey=$apikey"),
            ForYou(
                url:
                    "https://newsapi.org/v2/top-headlines?country=in&apiKey=$apikey"),
            ForYou(
                url:
                    "https://newsapi.org/v2/everything?q=tech%20news&apiKey=$apikey"),
            ForYou(
                url:
                    "https://newsapi.org/v2/everything?q=startup&apiKey=$apikey"),
            ForYou(
                url:
                    "https://newsapi.org/v2/everything?q=stocks%20news&apiKey=$apikey"),
            ForYou(
                url:
                    "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=$apikey")
          ],
        ),
      ),
    );
  }
}
