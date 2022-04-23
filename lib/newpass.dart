import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loginpage.dart';

class newpass extends StatelessWidget {
  const newpass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                height: 70,
              ),
              Container(
                child: Row(
                  children: [
                    InkWell(
                      onTap: (() {
                        Get.to(() => loginpage(),
                            transition: Transition.fade,
                            duration: (Duration(milliseconds: 400)));
                      }),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/img/me.jpg"),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Change your password",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 11,
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
                  maxLines: 1,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white10,
                      hintText: "Enter new password",
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
                  maxLines: 1,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white10,
                      hintText: "Confirm password",
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
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 14,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 29, 71, 92),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
