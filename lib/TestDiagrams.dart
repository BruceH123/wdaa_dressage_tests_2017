import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:wdaa_dressage_tests_2017/Levels.dart'; // GlobalLevel
// ignore: import_of_legacy_library_into_null_safe
import 'package:wdaa_dressage_tests_2017/LevelsInfo.dart'; // GlobalTest
// ignore: import_of_legacy_library_into_null_safe
import 'package:wdaa_dressage_tests_2017/TestInformation.dart'; // GlobalArena

final List<int> numbers = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24
];

String movementName = '';

class TestDiagrams extends StatelessWidget {
  var index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            elevation: 0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TestInfo()),
                  ); // Navigator.push
                } // onPressed
                ),
            title: Text('Test & Diagrams',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: stdFontSize,
            )
            ),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            // height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: Image.asset(
                        movementName = 'resources/$shortGlobalLevel/movements/'
                            '$shortGlobalLevel$shortGlobalTest$shortGlobalArena/'
                            '$shortGlobalLevel$shortGlobalTest$shortGlobalArena'
                            'M${numbers[index].toString()}.png',
                      ));
                } // itemCount
                ),
          ),
        );
  } // Widget build
} // class
