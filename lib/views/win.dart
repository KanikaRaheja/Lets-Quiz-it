import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:kbc_quiz/views/questions.dart';

class Win extends StatefulWidget {
  int quesMoney;
  String QuizID;
  Win(this.quesMoney, this.QuizID);

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {
  late ConfettiController confettiController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      initController();
    });
    confettiController.play();
  }

  void initController() {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/win.png"), fit: BoxFit.cover)),
      child: Scaffold(
        floatingActionButton: ElevatedButton(
          child: Text("Share with Friends!!"),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Congratulations!!!!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text("Your answer is correct!!!",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                  SizedBox(height: 15),
                  Text("You won",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  Text("Rs. ${widget.quesMoney}",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Image.asset("assets/img/cheque.png"),
                  ),
                  ElevatedButton(
                    child: Text("Next Question"),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Question(quizID: widget.QuizID, queMoney: widget.quesMoney)));
                    },
                  )
                ],
              ),
            ),
            buildConfettiWidget(confettiController, pi / 2)
          ],
        ),
      ),
    );
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
        alignment: Alignment.topCenter,
        child: ConfettiWidget(
          maximumSize: Size(30, 30),
          shouldLoop: false,
          confettiController: controller,
          blastDirection: blastDirection,
          blastDirectionality: BlastDirectionality.explosive,
          maxBlastForce: 20,
          minBlastForce: 8,
          emissionFrequency: 0.1,
          numberOfParticles: 8,
          gravity: 0.6,
        ));
  }
}
