import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:it/views/Tasks/Day2/day2.dart';
import 'package:it/views/Tasks/Day2/details.dart';
import 'package:it/views/Tasks/Day3/day3.dart';
import 'package:it/views/Tasks/Day4/day4.dart';
import 'package:it/views/main-view/main-view.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainView.router,
      routes: {
        MainView.router: (context) => const MainView(),
        //////////////////////////////////////////////////
        DAY2.router: (context) => const DAY2(),
        Details.router: (context) => const Details(),
        ////////////////////////////////////////////////
        Day3.router: (context) => const Day3(),
        Day4.router: (context) => const Day4(),
      },
    );
  }
}
