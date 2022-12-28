import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class QuizQuesCreator {
  static Future<Map> genQuizQue(String quizID, int quesMoney) async {
    late Map quesData;
    await FirebaseFirestore.instance
        .collection("quizzes")
        .doc(quizID)
        .collection("questions")
        .where("money",
            isEqualTo:
                quesMoney) //we have taken money as string in database....hence used string value here as well as in quiz intro while calling
        .get()
        .then((value) async {
      //generetae a random no bw 0 to docs.length
      var intval = value.docs.length;
       var interval= Random().nextInt(intval);
      // print(interval);
      quesData = value.docs.elementAt(interval).data();
    });
    print(quesData);
    return quesData;
  }
}
