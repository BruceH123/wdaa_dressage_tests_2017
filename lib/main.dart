// @dart=2.9
import 'package:flutter/material.dart';
import 'package:wdaa_dressage_tests_2017/DressageArena.dart';
import 'package:wdaa_dressage_tests_2017/Levels.dart';
import 'package:wdaa_dressage_tests_2017/LevelsInfo.dart';
import 'package:wdaa_dressage_tests_2017/Resources.dart';

void main() =>  runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(   // This MaterialApp call applies it to all files in the app.
      // No need to call it again in each file.
      debugShowCheckedModeBanner: false,
      title: '2017 WDAA Dressage Tests',
      theme: ThemeData(
        accentColor: Color(0xff9b5f26),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.accent,
        ),
      ),
      routes: {
        'Levels': (context) => Levels(),
        'LevelsInfo': (context) => LevelsInfo(),
        'DressageArena': (context) => DressageArena(),
        'Resources': (context) => Resources(),
      }, // routes

      home: Levels(),

    );
  }
}


