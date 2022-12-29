import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Fifty50 extends StatefulWidget {
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String correctAns;
  Fifty50(
      {required this.opt1,
      required this.opt2,
      required this.opt3,
      required this.opt4,
      required this.correctAns});

  @override
  State<Fifty50> createState() => _Fifty50State();
}

class _Fifty50State extends State<Fifty50> {
  late String WrongOpt1;
  late String WrongOpt2;
  List WrongOption = [];
  fetchWongOptions() {
    setState(() {
      if (widget.opt1 != widget.correctAns) {
        WrongOption.add(widget.opt1);
      }
      if (widget.opt2 != widget.correctAns) {
        WrongOption.add(widget.opt2);
      }
      if (widget.opt3 != widget.correctAns) {
        WrongOption.add(widget.opt3);
      }
      if (widget.opt4 != widget.correctAns) {
        WrongOption.add(widget.opt4);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchWongOptions();
        Future.delayed(Duration(seconds: 10), () => Navigator.pop(context));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 218, 200, 212),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 216, 164, 225),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 200),
            padding: EdgeInsets.symmetric(horizontal: 15,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "FIFTY 50 LIFELINE : ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  "  ${WrongOption[0]} AND ARE INCORRECT ANSWER!mfkm,kjemk,dhjrdmksxnjmkcd  ", //need to input more ques which have diff options and then display WrongOption[1] as well
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "You will be automatically redirected in 10 sec ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
