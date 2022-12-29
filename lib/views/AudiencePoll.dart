import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AudiencePoll extends StatefulWidget {
  String question;
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String correctAns;
  AudiencePoll(
      {required this.question,
      required this.opt1,
      required this.opt2,
      required this.opt3,
      required this.opt4,
      required this.correctAns});

  @override
  State<AudiencePoll> createState() => _AudiencePollState();
}

class _AudiencePollState extends State<AudiencePoll> {
  @override
  void initState() {
    super.initState();
    votingMachine();
  }

  int opt1Votes = 0;
  int opt2Votes = 0;
  int opt3Votes = 0;
  int opt4Votes = 0;
  bool isVoting = true;
  votingMachine() {
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        if (widget.opt1 == widget.correctAns) {
          opt1Votes = Random().nextInt(100);
        } else {
          opt1Votes = Random().nextInt(40);
        }
        if (widget.opt2 == widget.correctAns) {
          opt2Votes = Random().nextInt(100);
        } else {
          opt2Votes = Random().nextInt(40);
        }
        if (widget.opt3 == widget.correctAns) {
          opt3Votes = Random().nextInt(100);
        } else {
          opt3Votes = Random().nextInt(40);
        }

        if (widget.opt4 == widget.correctAns) {
          opt4Votes = Random().nextInt(100);
        } else {
          opt4Votes = Random().nextInt(40);
        }
        isVoting = false;
      });
      Future.delayed(Duration(seconds: 7), () {
        Navigator.pop(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 218, 200, 212),
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 200, horizontal: 20),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 216, 164, 225),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Audience poll lifeline !",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  "Question - ${widget.question}",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 23,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  isVoting ? "Audience is voting " : "Here are the results : ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                isVoting
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: LinearProgressIndicator(),
                      )
                    : Container(),
                SizedBox(height: 15),
                Text(
                  "${widget.opt1}\t\t${opt1Votes} voutes",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Color.fromARGB(255, 84, 42, 182)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  "${widget.opt2}\t\t${opt2Votes} voutes",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Color.fromARGB(255, 84, 42, 182)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  "${widget.opt3}\t\t${opt3Votes} voutes",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Color.fromARGB(255, 84, 42, 182)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  "${widget.opt4}\t\t${opt4Votes} voutes",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Color.fromARGB(255, 84, 42, 182)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ));
  }
}
