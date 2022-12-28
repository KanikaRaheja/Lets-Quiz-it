import 'package:flutter/material.dart';
import 'package:kbc_quiz/services/buyQuiz.dart';
import 'package:kbc_quiz/services/quizQuesCreator.dart';
import 'package:kbc_quiz/views/questions.dart';

import '../services/checkQuizUnlock.dart';
// import 'package:kbc/services/checkQuizUnlock.dart';

class QuizIntro extends StatefulWidget {
  String QuizName;
  String QuizImgUrl;
  String QuizTopics;
  String QuizDuration;
  String QuizAbout;
  String QuizId;
  String QuizPrize;
  QuizIntro(
      {required this.QuizAbout,
      required this.QuizDuration,
      required this.QuizImgUrl,
      required this.QuizName,
      required this.QuizTopics,
      required this.QuizId,
      required this.QuizPrize});

  @override
  _QuizIntroState createState() => _QuizIntroState();
}

class _QuizIntroState extends State<QuizIntro> {
  bool quizIsUnlcoked = false;
  getQuizUnlockStatus() async {
    await CheckQuizUnlock.checkQuizUnlockStatus(widget.QuizId)
        .then((unlockStatus) {
      setState(() {
        quizIsUnlcoked = unlockStatus;
      });
    });
  }

  @override
  void initState() {
    getQuizUnlockStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: Text(
          quizIsUnlcoked ? "START QUIZ" : "UNLOCK QUIZ",
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () async {
          quizIsUnlcoked
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Question(
                          quizID: widget.QuizId,
                          queMoney:
                              1000))) // await QuizQuesCreator.genQuizQue(widget.QuizId, 1000)
              : buyQuiz
                  .buybuyQuiz(
                      QuizPrize: int.parse(widget.QuizPrize),
                      QuizId: widget.QuizId)
                  .then((quizIsUnlocked) {
                  if (quizIsUnlocked) {
                    setState(() {
                      quizIsUnlcoked = true;
                    });
                  } else {
                    return showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              title: Text(
                                  "You do not have enough money to buy this quiz"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("OK"))
                              ],
                            )));
                  }
                });
        },
      ),
      appBar: AppBar(
        title: Text("KBC Quiz App"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.QuizName,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Image.network(
                widget.QuizImgUrl,
                fit: BoxFit.cover,
                height: 230,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.topic_outlined),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Related To -",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      widget.QuizTopics,
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.topic_outlined),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Duration -",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      "${widget.QuizDuration} Minutes",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
              ),
              quizIsUnlcoked
                  ? Container()
                  : Container(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.money),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Money -",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Text(
                            "Rs. ${widget.QuizPrize} Minutes",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 17),
                          )
                        ],
                      ),
                    ),
              Container(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.topic_outlined),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "About Quiz -",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(
                      widget.QuizAbout,
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
