import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/authentication.dart';
import 'package:project/newpass.dart';
import 'package:project/profile.dart';
import 'package:project/signup.dart';

var emailCTRL = TextEditingController();
var passCTRL = TextEditingController();

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/bg1.jpg"), fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.only(top: 200),
              child: Column(
                children: [
                  Text(
                    "Welcome to Safari",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Lato",
                        color: Color.fromARGB(255, 107, 49, 49)),
                  ),
                  Text(
                    "We offer you an unforgettable trip.",
                    style: TextStyle(fontFamily: "Lato", fontSize: 15),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 5,
                              offset: Offset(1, 1),
                              color: Color.fromARGB(255, 107, 49, 49)
                                  .withOpacity(0.2))
                        ]),
                    child: TextField(
                      controller: emailCTRL,
                      maxLines: 1,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 107, 49, 49),
                          ),
                          filled: true,
                          fillColor: Colors.white10,
                          hintText: "Username or Email",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 107, 49, 49),
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 107, 49, 49),
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 5,
                              offset: Offset(1, 1),
                              color: Color.fromARGB(255, 107, 49, 49)
                                  .withOpacity(0.2))
                        ]),
                    child: TextField(
                      controller: passCTRL,
                      obscureText: visible,
                      maxLines: 1,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.password,
                            color: Color.fromARGB(255, 107, 49, 49),
                          ),
                          suffixIcon: InkWell(
                            onTap: inContact,
                            child: Icon(
                              Icons.remove_red_eye,
                              color: Color.fromARGB(255, 107, 49, 49),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white10,
                          hintText: "Password",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 107, 49, 49),
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 107, 49, 49),
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      InkWell(
                        onTap: (() {
                          Get.to(() => newpass(),
                              transition: Transition.fade,
                              duration: (Duration(milliseconds: 400)));
                        }),
                        child: Text("Forgot your Password?",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            GestureDetector(
              onTap: () {
                Authentication.instance
                    .login(emailCTRL.text.trim(), passCTRL.text.trim());
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 14,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 29, 71, 92),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 4,
            ),
            InkWell(
              onTap: (() {
                Get.to(() => signup(),
                    transition: Transition.fade,
                    duration: (Duration(milliseconds: 400)));
              }),
              child: RichText(
                text: TextSpan(
                    text: "Don\'t have an account ?",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    children: [
                      TextSpan(
                          text: " Create",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold))
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  void inContact() {
    visible = !visible;
    setState(() {});
  }
}
