import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AskTheExpert extends StatefulWidget {
  String question;
  String ytURL;

  AskTheExpert({required this.question, required this.ytURL});

  @override
  State<AskTheExpert> createState() => _AskTheExpertState();
}

class _AskTheExpertState extends State<AskTheExpert> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 20), () => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.ytURL;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 200, horizontal: 30),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ASK THE EXPERT LIFELINE",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "QUESTION : ${widget.question}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: YoutubePlayer(
                  liveUIColor: Colors.blue,
                  controller: YoutubePlayerController(
                    initialVideoId: widget.ytURL,
                    flags: YoutubePlayerFlags(
                        isLive: true,
                        hideControls: true,
                        controlsVisibleAtStart: false,
                        autoPlay: true,
                        mute: false),
                  ),
                  showVideoProgressIndicator: true,
                ),
              ),
              Text(
                "This screen will disapper in 20 sec",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
