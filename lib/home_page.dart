import 'package:ToDoList/text_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white10,
          width: double.infinity,
          padding:
              EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0, bottom: 32.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        TextCard(
                            text: "Get Started!",
                            desc: "Hello this the first todo Task for today."),
                        TextCard(),
                        TextCard(),
                        TextCard(),
                        TextCard(),
                        TextCard(),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TaskPage();
                    }));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF7349FE),
                          borderRadius: BorderRadius.circular(20.0)),
                      height: 60,
                      width: 60,
                      child: Image(
                          image: AssetImage("assets/images/add_icon.png"))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
