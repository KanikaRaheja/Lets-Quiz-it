import 'package:flutter/material.dart';

class SideNav extends StatelessWidget {
  const SideNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // backgroundColor: Colors.purple,
        child: Material(
          color: Color.fromRGBO(128, 0, 128, 1),
          child: ListView(
            // padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text("Kaniaka Raheja",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("RS 50,000",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ],
                )
              ])),
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Text("Leaderboard- 230th Rank",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 48),
          listItem(label: "DAILY QUIZ", icon: Icons.quiz),
          listItem(label: "Leaderboard", icon: Icons.leaderboard),
          listItem(label: "How to Use", icon: Icons.question_answer),
          listItem(label: "About Us", icon: Icons.face),
        ],
      ),
    ));
  }

  Widget listItem({required String label, required IconData icon}) {
    final color = Colors.white;
    final hovercolor = Colors.white60;

    return ListTile(
      leading: Icon(icon, color: color),
      hoverColor: hovercolor,
      title: Text(label, style: TextStyle(color: color)),
      onTap: () {},
    );
  }
}
