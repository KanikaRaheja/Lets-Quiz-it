import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kbc_quiz/services/InternetConn.dart';
import 'package:kbc_quiz/services/auth.dart';
import 'package:overlay_support/overlay_support.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      showSimpleNotification(Text(
          connected ? "CONNECTED TO INTERNET" : "NOT CONNECTED TO INTERNET"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/img/kbc.png"),
              SizedBox(height: 22),
              Text("Welcome to kbc quiz app",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              SignInButton(Buttons.GoogleDark, onPressed: () async {
                await signWithGoogle();
              }),
              SizedBox(height: 10),
              Text("By continuing you are accepting out tems and conditions")
            ],
          ),
        ));
  }
}
