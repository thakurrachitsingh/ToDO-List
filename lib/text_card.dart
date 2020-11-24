import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  final String text;
  final String desc;
  TextCard({this.text, this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), color: Colors.white),
        padding:
            EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0, top: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text ?? 'No task given',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold)),
            Text(desc ?? 'No descreption',
                style: TextStyle(fontSize: 16.0, color: Colors.blueGrey)),
          ],
        ));
  }
}

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 28.0, bottom: 10.0, left: 10.0, right: 10.0),
                child: TextField(
                    decoration: InputDecoration(
                        icon: InkWell(
                          child: Image(
                            image: AssetImage(
                              "assets/images/back_arrow_icon.png",
                            ),
                            height: 40,
                            width: 40.0,
                          ),
                        ),
                        hintText: "Enter The Task",
                        hintStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 25,
                            fontWeight: FontWeight.w300),
                        border: InputBorder.none),
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter Description of the Task.",
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0)),
              ),
              ToDoWidget(text: "first Task", isDone: true),
              ToDoWidget(
                text: "Create ToDO task Aswell",
                isDone: true,
              ),
              ToDoWidget(isDone: false),
              ToDoWidget(
                isDone: false,
              ),
            ],
          ),
          Positioned(
            bottom: 24.0,
            right: 24.0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TaskPage();
                }));
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFFE3572),
                      borderRadius: BorderRadius.circular(20.0)),
                  height: 60,
                  width: 60,
                  child: Image(
                      image: AssetImage("assets/images/delete_icon.png"))),
            ),
          )
        ],
      )),
    ));
  }
}

class ToDoWidget extends StatelessWidget {
  final String text;
  final bool isDone;
  ToDoWidget({this.text, @required this.isDone});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 8.0,
        ),
        child: Row(
          children: [
            Container(
              height: 20.0,
              width: 20.0,
              margin: EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                  color: isDone ? Color(0xFF7349FE) : Colors.transparent,
                  borderRadius: BorderRadius.circular(6.0),
                  border: isDone ? null : Border.all(width: 1.5)),
              child: Image(
                image: AssetImage("assets/images/check_icon.png"),
              ),
            ),
            Text(text ?? "(Unnamed Task)",
                style: TextStyle(
                  fontSize: 16.0,
                  color: isDone ? Colors.black : Colors.blueGrey,
                  fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
                )),
          ],
        ));
  }
}
