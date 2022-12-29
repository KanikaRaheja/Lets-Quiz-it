// import 'dart:html';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kbc_quiz/services/AskTheExpert.dart';
import 'package:kbc_quiz/views/AudiencePoll.dart';
import 'package:kbc_quiz/views/fifty50.dart';
import 'package:kbc_quiz/views/questions.dart';

import '../services/localdb.dart';

class Lifeline_Drawer extends StatefulWidget {
  String question;
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String quizId;
  int currentQueMon;
  String correctAns;
  // String AnswerYTLink;

  Lifeline_Drawer({
    required this.question,
    required this.opt1,
    required this.opt2,
    required this.opt3,
    required this.opt4,
    required this.correctAns,
    required this.quizId,
    required this.currentQueMon,
    // required this.AnswerYTLink
  });

  @override
  State<Lifeline_Drawer> createState() => _Lifeline_DrawerState();
}

class _Lifeline_DrawerState extends State<Lifeline_Drawer> {
  bool aa = true;
  Future<bool> checkAudAvail() async {
    bool AudAvail = true;
    await LocalDB.getAud().then((value) {
      AudAvail = value!;
    });
    return AudAvail;
  }

  Future<bool> checkJokAvail() async {
    bool JokAvail = true;
    await LocalDB.getJok().then((value) {
      JokAvail = value!;
    });
    return JokAvail;
  }

  Future<bool> check50Avail() async {
    bool f50Avail = true;
    await LocalDB.get50().then((value) {
      f50Avail = value!;
    });
    return f50Avail;
  }

  Future<bool> checkExpAvail() async {
    bool ExpAvail = true;
    await LocalDB.getExp().then((value) {
      ExpAvail = value!;
    });
    return ExpAvail;
  }

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
            InkWell(
              onTap: () async {
                if (await checkAudAvail()) {
                  await LocalDB.saveAud(false);
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
                } else {
                  print("AUDIENCE POLL ALREADY USED");
                }
              },
              child: Column(
                children: [
                  Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.purpleAccent),
                      child: Icon(Icons.people, size: 32, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Audience\n Poll",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                if (await checkJokAvail()) {
                  await LocalDB.saveJok(false);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Question(
                              quizID: widget.quizId,
                              queMoney: widget.currentQueMon)));
                } else {
                  print("JOKER LIFELINE IS ALREADY USED");
                }
              },
              child: Column(
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
                    "Joker\nCircle",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                if (await check50Avail()) {
                  await LocalDB.save50(false);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Fifty50(
                              opt1: widget.opt1,
                              opt2: widget.opt2,
                              opt3: widget.opt3,
                              opt4: widget.opt4,
                              correctAns: widget.correctAns)));
                } else {
                  print("YOU ALREADY USED FIFTY 50 LIFELINE");
                }
              },
              child: Column(
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
                          Icon(Icons.star_half, size: 32, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Fifty\n50",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                if (await checkExpAvail()) {
                  await FirebaseFirestore.instance
                      .collection("quizzes")
                      .doc(widget.quizId)
                      .collection("questions")
                      .where("question", isEqualTo: widget.question)
                      .get()
                      .then((value) async {
                    String YTurl=value.docs.elementAt(0).data()["ansYTLink"];

                    await LocalDB.saveExp(false);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AskTheExpert(
                              question: widget.question,ytURL: YTurl,)));


                  });
                  // await LocalDB.saveExp(false);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => AskTheExpert(
                  //             question: widget.question,
                  //             ytURL: widget.AnswerYTLink)));
                  print("hyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
                } else {
                  print("YOU ALREADY USED ASK THE EXPERT LIFELINE");
                }
              },
              child: Column(
                children: [
                  Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.purpleAccent),
                      child: Icon(Icons.desktop_mac,
                          size: 32, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    "Ask the\n Expert",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
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
                    if (2500 * (pow(2, index + 1)) == widget.currentQueMon) {
                      return ListTile(
                        tileColor: Colors.purpleAccent,
                        leading: Text("${index + 1}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        title: Text("Rs.${2500 * (pow(2, index + 1))}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white)),
                        trailing: Icon(
                          Icons.circle,
                          color: Colors.purpleAccent,
                        ),
                      );
                    }
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
