import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:newsapp/MainScreen/pages/bookmark.dart";
import "package:newsapp/MainScreen/pages/home.dart";
import "package:newsapp/MainScreen/pages/profile.dart";
import "package:newsapp/MainScreen/pages/quick_read.dart";
import "package:newsapp/introScreen/Screen/login_option_screen.dart";

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  int selectIndex = 0;
  void changeIndex(int index){
    setState(() {
      selectIndex = index;
    });
  }
  List Pages = [Home(), QuickRead(), Bookmark()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[selectIndex],
      




      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          changeIndex(value);
        },
        currentIndex: selectIndex,
        unselectedItemColor: Colors.grey.shade500,
        selectedItemColor: Colors.indigo,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          selectedLabelStyle: TextStyle(color: Colors.blue),
          items: [
            BottomNavigationBarItem(
              
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.home,
                  
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.newspaper,
                  
                  size: 30,
                ),
                label: "QuickRead"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark,
                  
                  size: 30,
                ),
                label: "Bookmark"),
            
          ]),
    );
  }
}
