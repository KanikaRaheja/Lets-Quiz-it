import 'package:flutter/material.dart';

class QuizIntro extends StatelessWidget {
  const QuizIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
          onPressed: () {},
          child: Text("start Quiz", style: TextStyle(fontSize: 20))),
      appBar: AppBar(
        title: Text("KBC Quiz app"),
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
                  Text("Quiz Name",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500))
                ],
              ),
            ),
            Image.network(
                "https://images.unsplash.com/photo-1670942298778-f339cac1fe01?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                fit: BoxFit.cover,
                height: 230,
                width: MediaQuery.of(context).size.width),
            Container(
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.topic_outlined),
                      SizedBox(width: 6),
                      Text("Related To -",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text("Science, Space, Astronomy, Rocket, ISRO",
                      style: TextStyle(fontSize: 20))
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
                      Icon(Icons.timer),
                      SizedBox(width: 6),
                      Text("Duration  -",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text("10 Minutes", style: TextStyle(fontSize: 20))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.topic_outlined),
                      SizedBox(width: 6),
                      Text("About Quiz -",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nec eleifend metus. Integer suscipit tincidunt tristique. Cras semper, ligula sed elementum dapibus, dolor purus congue enim, sed dapibus ante est non nunc. Aenean in pulvinar dui, eu porta mauris. Donec augue quam, tincidunt ut elementum at, dictum eu eros. Sed varius dui at nunc dapibus, et luctus nulla eleifend. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aenean ut luctus mauris. Aliquam vulputate in nisi vestibulum gravida Maecenas elementum est et odio ultrices, sit amet elementum purus aliquam. Nulla venenatis massa non lorem condimentum, et pharetra sapien cursus. Sed libero felis, mollis quis mauris a, egestas luctus ipsum. Aenean a tincidunt enim. Sed bibendum erat justo, eleifend efficitur mauris facilisis vel. Suspendisse felis mi, aliquam id pellentesque sed, iaculis a metus. Donec a purus aliquam, placerat odio non, lacinia quam. Quisque ut imperdiet augue.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nec eleifend metus. Integer suscipit tincidunt tristique. Cras semper, ligula sed elementum dapibus, dolor purus congue enim, sed dapibus ante est non nunc. Aenean in pulvinar dui, eu porta mauris. Donec augue quam, tincidunt ut elementum at, dictum eu eros. Sed varius dui at nunc dapibus, et luctus nulla eleifend. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aenean ut luctus mauris. Aliquam vulputate in nisi vestibulum gravida. Maecenas elementum est et odio ultrices, sit amet elementum purus aliquam. Nulla venenatis massa non lorem condimentum, et pharetra sapien cursus. Sed libero felis, mollis quis mauris a, egestas luctus ipsum. Aenean a tincidunt enim. Sed bibendum erat justo, eleifend efficitur mauris facilisis vel. Suspendisse felis mi, aliquam id pellentesque sed, iaculis a metus. Donec a purus aliquam, placerat odio non, lacinia quam. Quisque ut imperdiet augue.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nec eleifend metus. Integer suscipit tincidunt tristique. Cras semper, ligula sed elementum dapibus, dolor purus congue enim, sed dapibus ante est non nunc. Aenean in pulvinar dui, eu porta mauris. Donec augue quam, tincidunt ut elementum at, dictum eu eros. Sed varius dui at nunc dapibus, et luctus nulla eleifend. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aenean ut luctus mauris. Aliquam vulputate in nisi vestibulum gravida. Maecenas elementum est et odio ultrices, sit amet elementum purus aliquam. Nulla venenatis massa non lorem condimentum, et pharetra sapien cursus. Sed libero felis, mollis quis mauris a, egestas luctus ipsum. Aenean a tincidunt enim. Sed bibendum erat justo, eleifend efficitur mauris facilisis vel. Suspendisse felis mi, aliquam id pellentesque sed, iaculis a metus. Donec a purus aliquam, placerat odio non, lacinia quam. Quisque ut imperdiet augue.",
                      style: TextStyle(fontSize: 20))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
