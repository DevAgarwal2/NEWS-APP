import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:newsapp/MainScreen/home_page.dart";
import "package:newsapp/introScreen/Comp/button.dart";
import "package:newsapp/introScreen/Comp/textfield.dart";
import "package:newsapp/introScreen/Screen/login_option_screen.dart";

class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key,required this.ontap});
  Function()? ontap;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  void emailSignin() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (password.text == confirmPassword.text) {
      final UserCredential =  await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Account Registered")));
        User? user = FirebaseAuth.instance.currentUser;
        if(user != null){
          String name = email.text.split('@')[0];
          await UserCredential.user!.updateDisplayName(name);
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Password dont match")));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Image.asset(
                "assets/news_741867.png",
                height: 150,
                width: 150,
              )),
              SizedBox(
                height: 70,
              ),
              myTextField(
                  text: "Enter the Email",
                  obstrueText: false,
                  textEditingController: email),
              SizedBox(
                height: 18,
              ),
              myTextField(
                  text: "Enter the Password",
                  obstrueText: true,
                  textEditingController: password),
              SizedBox(
                height: 20,
              ),
              myTextField(
                  text: "Confirm Password",
                  obstrueText: true,
                  textEditingController: confirmPassword),
              SizedBox(
                height: 30,
              ),
              myButton(
                text: "Login",
                color: Colors.grey.shade900,
                ontap: () {
                  emailSignin();
                },
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OR",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Registered",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: widget.ontap,
                    child: Text(
                      "Login Now",
                      style: TextStyle(
                          color: Colors.blue.shade800,
                          fontSize: 14,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
