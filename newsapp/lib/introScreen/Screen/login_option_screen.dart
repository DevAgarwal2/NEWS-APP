import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:newsapp/introScreen/Comp/button.dart";
import "package:newsapp/introScreen/Comp/google_comp.dart";
import "package:newsapp/introScreen/Comp/textfield.dart";
import "package:newsapp/introScreen/Screen/register_screen.dart";
import "package:newsapp/introScreen/auth/auth_service.dart";

class LoginOption extends StatefulWidget {
   LoginOption({super.key,required this.ontap});
  Function()? ontap;

  @override
  State<LoginOption> createState() => _LoginOptionState();
}

class _LoginOptionState extends State<LoginOption> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      print(e.code);
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
                "assets/news-report_741854.png",
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
              InkWell(
                  onTap: () {
                    AuthService().googleSignIn();
                  },
                  child: GoogleComp(image: "assets/search_281764.png")),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not Registered",
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
                      "Register Now",
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
