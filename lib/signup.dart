import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/authentication.dart';
import 'package:project/profile.dart';

var emailCTRL = TextEditingController();
var passCTRL = TextEditingController();

class signup extends StatelessWidget {
  const signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List social = ["fb.png", "google.png"];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/img/bg1.jpg"), fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/img/me.jpg"),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
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
                          color:
                              Color.fromARGB(255, 107, 49, 49).withOpacity(0.2))
                    ]),
                child: TextField(
                  controller: emailCTRL,
                  maxLines: 1,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 107, 49, 49),
                      ),
                      //filled: true,
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
                          color:
                              Color.fromARGB(255, 107, 49, 49).withOpacity(0.2))
                    ]),
                child: TextField(
                  controller: passCTRL,
                  // maxLines: 1,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Color.fromARGB(255, 107, 49, 49),
                      ),
                      // filled: true,
                      fillColor: Colors.white10,
                      hintText: "Enter a Password",
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
                height: MediaQuery.of(context).size.height / 20,
              ),
              GestureDetector(
                onTap: () {
                  Authentication.instance
                      .register(emailCTRL.text.trim(), passCTRL.text.trim());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 14,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 29, 71, 92),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 75,
              ),
              Text("Sign up with social media",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              Wrap(
                children: List<Widget>.generate(2, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white.withOpacity(0.6),
                      backgroundImage:
                          AssetImage("assets/img/" + social[index]),
                    ),
                  );
                }),
              )
            ],
          ),
        ));
  }
}
