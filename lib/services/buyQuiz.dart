import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'localdb.dart';

class buyQuiz {
  static Future<bool> buybuyQuiz(
      {required int QuizPrize, required String QuizId}) async {
    String user_id = "";
    bool isMoney = false;
    await LocalDB.getUserID().then((uID) {
      user_id = uID!;
    });
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user_id)
        .get()
        .then((user) {
      isMoney = QuizPrize <= int.parse(user.data()!["money"]);
    });
    if (isMoney) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user_id)
          .collection("unlocked_quiz")
          .doc(QuizId)
          .set({
        "unlocked_at": DateTime.now(),
      });
      print(DateTime.now());
      print("quiz is unlocked");
      await FirebaseFirestore.instance.collection("users").doc(user_id).get().then((user){user.data()!["money"]= user.data()!["money"]-(QuizPrize);});
      return true;
    } else {
      print("Money insuffecient");
      return false;
    }
  }
}
