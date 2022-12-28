import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kbc_quiz/services/localdb.dart';
// import 'package:kbc_quiz/views/loser.dart';
// import 'package:kbc_quiz/views/profile.dart';
// import 'package:kbc_quiz/views/questions.dart';
// import 'package:kbc_quiz/views/quizintro.dart';
import 'package:kbc_quiz/views/home.dart';
import 'package:kbc_quiz/views/login.dart';
// import 'package:kbc_quiz/views/win.dart';
import 'package:overlay_support/overlay_support.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   // bool isLogIn = false;

//   // getLoggedInState() async{
//   //   await LocalDB.getUserID().then((value){
//   //     setState((){
//   //       isLogIn = value.toString() != "null" ;
//   //     });
//   //   });
//   // }

//   @override
//   void initState() {
//     super.initState();
//     getLoggedInState();
//   }

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return OverlaySupport.global(
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//           title: 'Lets Quiz IT',
//           theme: ThemeData(
//             primarySwatch: Colors.indigo,
//           ),
//           home: Profile()),
//     );
//   }
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogIn = false;

  getLoggedInState() async {
    await LocalDB.getUserID().then((value) {
      setState(() {
        isLogIn = value.toString() != "null";
        
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getLoggedInState();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KBC Quiz',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: isLogIn ? Home() : Login(),
      ),
    );
  }
}
