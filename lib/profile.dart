import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/loginpage.dart';

import 'authentication.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    var africa = {
      "tunisia.jpg": "tunsia",
      "morocco.jpg": "morocco",
      "safrica.jpg": "south africa"
    };
    var europe = {
      "italy.jpg": "italy",
      "paris.jpg": "france",
      "greece.jpg": "greece"
    };
    var america = {
      "california.jpg": "america",
    };

    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.only(top: 100, left: 20),
        child: Row(children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/me.jpg"), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.withOpacity(0.3)),
          ),
          Expanded(
              child: RichText(
            text: TextSpan(
                text: "Welcome",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                ]),
          ))
        ]),
      ),
      SizedBox(
        height: 60,
      ),
      Container(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          "Your recent destinations.",
          style: TextStyle(
              color: Color.fromARGB(255, 29, 71, 92),
              fontSize: 20,
              fontWeight: FontWeight.w800),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
          child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
            labelPadding: const EdgeInsets.only(left: 20, right: 20),
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: indication_point(
                color: Color.fromARGB(255, 29, 71, 92), radius: 4),
            tabs: [
              Tab(text: "Africa"),
              Tab(text: "Europe"),
              Tab(text: "America"),
            ]),
      )),
      Container(
        padding: const EdgeInsets.only(left: 15),
        height: 250,
        width: double.maxFinite,
        child: TabBarView(controller: _tabController, children: [
          ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(right: 10, top: 10),
                  width: 150,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/img/" + africa.keys.elementAt(index)))),
                );
              }),
          ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, top: 10),
                    width: 150,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/img/" + europe.keys.elementAt(index)))),
                  ),
                );
              }),
          Container(
              child: Container(
            margin: const EdgeInsets.only(right: 10, top: 10),
            width: 150,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("assets/img/california.jpg"))),
          )),
        ]),
      ),
      SizedBox(height: MediaQuery.of(context).size.height / 5.5),
      Row(
        children: [
          Expanded(child: Container()),
          GestureDetector(
            onTap: () {
              Authentication.instance.logout();
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 29, 71, 92),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Sign out",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      )
    ]));
  }
}

class indication_point extends Decoration {
  final Color color;
  double radius;
  indication_point({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return pointpainter(color: color, radius: radius);
  }
}

class pointpainter extends BoxPainter {
  final Color color;
  double radius;
  pointpainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleoffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleoffset, radius, paint);
  }
}
