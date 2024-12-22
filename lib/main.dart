import 'package:blocbasic/features/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //   theme: CupertinoThemeData(
      //   primaryColor: CupertinoColors.activeBlue,
      // ),
      home: const HomePage(),
    );
  }
}
