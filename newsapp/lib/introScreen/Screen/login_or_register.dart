import "package:flutter/material.dart";
import "package:newsapp/introScreen/Screen/login_option_screen.dart";
import "package:newsapp/introScreen/Screen/register_screen.dart";
class LogorRegister extends StatefulWidget {
  const LogorRegister({super.key});

  @override
  State<LogorRegister> createState() => _LogorRegisterState();
}

class _LogorRegisterState extends State<LogorRegister> {
  bool showPage = true;

  void togglePage(){
    setState(() {
      showPage = !showPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showPage){
      return LoginOption(ontap: togglePage,);
      
    }
    else{
      return RegisterScreen(ontap: togglePage,);
    }
  }
}