import 'dart:math';

import 'package:flutter/material.dart';

class Loser extends StatelessWidget {
  int wonMon;
  String correctAns;
  Loser({required this.wonMon, required this.correctAns});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/loose.png"), fit: BoxFit.cover)),
      child: Scaffold(
        floatingActionButton: ElevatedButton(
          child: Text("Retry!!"),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Ohh Sorry!!!!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text("Your answer is Incorrect!!!",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              Text("Correct answer is : ${correctAns}",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
              SizedBox(height: 15),
              Text("You Won",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
              Text("Rs.${wonMon == 500 ? 0 : wonMon}",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(
                height: 25,
              ),
              Icon(
                Icons.error_outline,
                color: Colors.white,
                size: 100,
              ),
              ElevatedButton(
                child: Text("Go to rewards"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
