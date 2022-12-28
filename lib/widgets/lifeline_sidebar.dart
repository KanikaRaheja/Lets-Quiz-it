import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kbc_quiz/views/AudiencePoll.dart';

class Lifeline_Drawer extends StatefulWidget {
  String question;
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String correctAns;

  Lifeline_Drawer({required this.question, required this.opt1,required this.opt2,required this.opt3,required this.opt4,required this.correctAns});

  @override
  State<Lifeline_Drawer> createState() => _Lifeline_DrawerState();
}

class _Lifeline_DrawerState extends State<Lifeline_Drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
            child: Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            child: Text("Lifeline",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => AudiencePoll(
                                question: widget.question,
                                opt1: widget.opt1,
                                opt2: widget.opt2,
                                opt3: widget.opt3,
                                opt4: widget.opt4,
                                correctAns: widget.correctAns))));
                  },
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black54),
                      child: Icon(Icons.people, size: 32, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "Audience\n Poll",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purpleAccent),
                    child: Icon(Icons.change_circle,
                        size: 32, color: Colors.white),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "Joker\n Circle",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purpleAccent),
                    child: Icon(Icons.two_k_plus_sharp,
                        size: 32, color: Colors.white),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "Double\n Dip",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.purpleAccent),
                    child:
                        Icon(Icons.desktop_mac, size: 32, color: Colors.white),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "Ask the\n Expert",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 5),
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            child: Text("PRIZES",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: 500,
            child: Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text("${index + 1}",
                          style: TextStyle(color: Colors.grey, fontSize: 20)),
                      title: Text("Rs.${2500 * (pow(2, index + 1))}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      trailing: Icon(Icons.circle),
                    );
                    // );
                  }),
            ),
          ),
        ),
      ],
    )));
  }
}
