import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kbc_quiz/services/QuestionModel.dart';
import 'package:kbc_quiz/services/localdb.dart';
import 'package:kbc_quiz/views/loser.dart';
import 'package:kbc_quiz/views/win.dart';
import 'package:kbc_quiz/widgets/lifeline_sidebar.dart';

import '../services/firedb.dart';
import '../services/quizQuesCreator.dart';

class Question extends StatefulWidget {
  String quizID;
  int queMoney;
  Question({required this.quizID, required this.queMoney});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  QuestionModel questionmodel = new QuestionModel();
  //  String AnswerYTLink="" ;
  genQue() async {
    await QuizQuesCreator.genQuizQue(widget.quizID, widget.queMoney)
        .then((queData) {
      setState(() {
        // AnswerYTLink = queData["ansYTLink"];
        questionmodel.question = queData["question"];
        questionmodel.correctAns = queData["correctAns"];
        List options = [
          queData["opt1"],
          queData["opt2"],
          queData["opt3"],
          queData["opt4"]
        ];

        options.shuffle();
        questionmodel.option1 = options[0];
        questionmodel.option2 = options[1];
        questionmodel.option3 = options[2];
        questionmodel.option4 = options[3];
      });
    });
  }

  bool optAlocked = false;
  bool optBlocked = false;
  bool optClocked = false;
  bool optDlocked = false;

  int maxSeconds = 30;
  int seconds = 30;
  Timer? timer;

  QueTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() => seconds--);
      if (seconds == 0) {
        timer?.cancel();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Loser(
                    wonMon: widget.queMoney == 1000 ? 0 : widget.queMoney ~/ 2,
                    correctAns: questionmodel.correctAns)));
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genQue();
    QueTimer();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool?> showWarning(
            {required BuildContext context,
            required String title,
            required String content}) async =>
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(title),
                  content: Text(content),
                  actions: [
                    ElevatedButton(
                       onPressed: () async {
                        await FireDB.updateMoney(widget.queMoney == 5000
                            ? 0
                            : widget.queMoney ~/ 2);
                        Navigator.pop(context, true);
                      },
                        child: Text("No!")),
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text("Okay!"))
                  ],
                ));

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/background.png"))),
        child: WillPopScope(
          onWillPop: () async {
            final exitQuiz = await showWarning(
                context: context,
                title: "DO YOU WANT TO EXIT QUIZ ?",
                content: "You will lose all your money for this quiz");
            return exitQuiz ?? false;
          },
          child: Scaffold(
              onDrawerChanged: ((isOpened) {
                timer?.cancel();
                isOpened ? timer?.cancel() : QueTimer();
              }),
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text("Rs ${widget.queMoney}",
                    style: TextStyle(fontSize: 25)),
                centerTitle: true,
              ),
              drawer: Lifeline_Drawer(
                question: questionmodel.question,
                opt1: questionmodel.option1,
                opt2: questionmodel.option2,
                opt3: questionmodel.option3,
                opt4: questionmodel.option4,
                correctAns: questionmodel.correctAns,
                quizId: widget.quizID,
                currentQueMon: widget.queMoney,
                // AnswerYTLink: questionmodel.YTLink,

                // AnswerYTLink: AnswerYTLink,
              ),
              floatingActionButton: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              title: Text("DO YOU WANT TO QUIT THE GAME"),
                              content: Text(
                                  "You will get Rs.${widget.queMoney == 5000 ? 0 : widget.queMoney / 2} in your account"),
                              actions: [
                                ElevatedButton(
                                    onPressed: () async {
                                      FireDB.updateMoney(widget.queMoney == 1000
                                          ? 0
                                          : widget.queMoney ~/ 2);
                                      timer?.cancel();
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Text("QUIT")),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("CANCEL"))
                              ],
                            )));
                  },
                  child: Text("QUIT GAME", style: TextStyle(fontSize: 27))),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 12,
                          backgroundColor: Color.fromARGB(255, 49, 3, 173),
                          value: seconds / maxSeconds,
                        ),
                        Center(
                            child: Text(seconds.toString(),
                                style: TextStyle(
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                      padding: EdgeInsets.all(14),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        questionmodel.question,
                        style: TextStyle(fontSize: 22),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      print("Double tap to lock answer");
                    },
                    onDoubleTap: () {
                      setState(() {
                        optAlocked = true;
                      });

                      Future.delayed(Duration(seconds: 2), () async {
                        if (questionmodel.option1 == questionmodel.correctAns) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Win(widget.queMoney * 2, widget.quizID)));
                        } else {
                          await FireDB.updateMoney(widget.queMoney ~/ 2);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loser(
                                  wonMon: (widget.queMoney ~/ 2),
                                  correctAns: questionmodel.correctAns,
                                ),
                              ));
                        }
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(14),
                      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                      decoration: BoxDecoration(
                          color: optAlocked
                              ? Colors.yellow.withOpacity(0.4)
                              : Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "A.${questionmodel.option1} ",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Double tap to lock answer");
                    },
                    onDoubleTap: () {
                      setState(() {
                        optBlocked = true;
                      });

                      Future.delayed(Duration(seconds: 2), () async {
                        if (questionmodel.option2 == questionmodel.correctAns) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Win(widget.queMoney * 2, widget.quizID)));
                        } else {
                          await FireDB.updateMoney(widget.queMoney ~/ 2);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loser(
                                  wonMon: (widget.queMoney ~/ 2),
                                  correctAns: questionmodel.correctAns,
                                ),
                              ));
                        }
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(14),
                      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                      decoration: BoxDecoration(
                          color: optBlocked
                              ? Colors.yellow.withOpacity(0.4)
                              : Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "B.${questionmodel.option2} ",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Double tap to lock answer");
                    },
                    onDoubleTap: () {
                      setState(() {
                        optClocked = true;
                      });

                      Future.delayed(Duration(seconds: 2), () async {
                        if (questionmodel.option3 == questionmodel.correctAns) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Win(widget.queMoney * 2, widget.quizID)));
                        } else {
                          await FireDB.updateMoney(widget.queMoney ~/ 2);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loser(
                                  wonMon: (widget.queMoney ~/ 2),
                                  correctAns: questionmodel.correctAns,
                                ),
                              ));
                        }
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(14),
                      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                      decoration: BoxDecoration(
                          color: optClocked
                              ? Colors.yellow.withOpacity(0.4)
                              : Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "C.${questionmodel.option3} ",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Double tap to lock answer");
                    },
                    onDoubleTap: () {
                      setState(() {
                        optDlocked = true;
                      });

                      Future.delayed(Duration(seconds: 2), () async {
                        if (questionmodel.option4 == questionmodel.correctAns) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Win(widget.queMoney * 2, widget.quizID)));
                        } else {
                          await FireDB.updateMoney(widget.queMoney ~/ 2);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loser(
                                  wonMon: (widget.queMoney ~/ 2),
                                  correctAns: questionmodel.correctAns,
                                ),
                              ));
                        }
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(14),
                      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                      decoration: BoxDecoration(
                          color: optDlocked
                              ? Colors.yellow.withOpacity(0.4)
                              : Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30)),
                      child: Text(
                        "D.${questionmodel.option4} ",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
