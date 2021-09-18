// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wdaa_dressage_tests_2017/CallerAudios.dart';
import 'package:wdaa_dressage_tests_2017/Levels.dart';
import 'package:wdaa_dressage_tests_2017/LevelsInfo.dart';
import 'package:wdaa_dressage_tests_2017/PdfDisplay.dart';
import 'package:wdaa_dressage_tests_2017/TestDiagrams.dart';

var longGlobalArena = '';
/*
Initializes the globalLevel variable set below in
the onPressed section of the TextButtons
  longGloballArena variables are:
    Large Arena
    Small Arena
*/

var shortGlobalArena = '';

/*
Initializes the globalLevel variable set below in
the onPressed section of the TextButtons
  smallGlobalArena variables are:
    L
    S
*/

var globalReturn = 'TestInfo';

// ignore: must_be_immutable
class TestInfo extends StatelessWidget {
  var longGlobalArena = '';
  var shortGlobalArena = '';
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
                      MaterialPageRoute(builder: (context) => LevelsInfo()),
                    ); // Navigator.push
                  } // onPressed
                  ),
              title: Text('Test Information',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: stdFontSize,
              )
              ),
            ),

            // Set up the screen in the proper order and permit scrolling
            body: ListView(children: <Widget>[
              // Add the three top Text Labels as Rows
              Row(
                // 2017 WDAA longLevel Information
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0,
                          MediaQuery.of(context).size.height * 0.01, 0.0, 0.0),
                      child: Text(
                        '2017 WDAA $longGloballevel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: stdFontSize,
                        ), // style
                      ), //
                    ),
                  ),
                ],
              ),

              Row(
                // longTest
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0,
                          MediaQuery.of(context).size.height * 0.01, 0.0, 0.0),
                      child: Text(
                        '$longGlobalTest',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: stdFontSize,
                        ), // style
                      ), //
                    ),
                  ),
                ],
              ),

              Row(
                // Test & Diagrams
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0,
                          MediaQuery.of(context).size.height * 0.015, 0.0, 0.0),
                      child: Text(
                        'Diagram Arena Selection',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: stdFontSize,
                        ), // style
                      ), //
                    ),
                  ),
                ],
              ),

              arena_Diagram_Button(
                  shortArenaName: 'L', longArenaName: 'Large Arena'),

              shortGlobalLevel == 'L1' ||
                      shortGlobalLevel == 'L2' ||
                      shortGlobalLevel == 'L3' ||
                      shortGlobalLevel == 'L4'
                  ? arena_Diagram_Button(shortArenaName: '', longArenaName: '')
                  : arena_Diagram_Button(
                      shortArenaName: 'S', longArenaName: 'Small Arena'),

              Row(
                // Caller Audios
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0,
                          MediaQuery.of(context).size.height * 0.02, 0.0, 0.0),
                      child: Text(
                        'Caller Audio Arena Selection',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: stdFontSize,
                        ), // style
                      ), //
                    ),
                  ),
                ],
              ),

               arena_Audio_Button(
                  shortArenaName: 'L', longArenaName: 'Large Arena'),

              shortGlobalLevel == 'L1' ||
                      shortGlobalLevel == 'L2' ||
                      shortGlobalLevel == 'L3' ||
                      shortGlobalLevel == 'L4'
                  ? arena_Audio_Button(shortArenaName: '', longArenaName: '')
                  : arena_Audio_Button(
                      shortArenaName: 'S', longArenaName: 'Small Arena'),

              Row(
                // Caller Audios
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0,
                          MediaQuery.of(context).size.height * 0.02, 0.0, 0.0),
                      child: Text(
                        'Other Test Documents',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: stdFontSize,
                        ), // style
                      ), //
                    ),
                  ),
                ],
              ),

              PdfButton(
                  displayURL: 'resources/$shortGlobalLevel/handbook'
                      '/HB$shortGlobalLevel$shortGlobalTest.pdf',
                  buttonName: 'Callers Handbook',
                  type: 'pdfAsset',
                  appBarName: 'Callers Handbook'),

              PdfButton(
                  displayURL: 'resources/$shortGlobalLevel/scoringshts'
                      '/$shortGlobalLevel$shortGlobalTest.pdf',
                  buttonName: 'Official WDAA Scoring Sheets',
                  type: 'pdfAsset',
                  appBarName: 'Scoring Sheets'),

              Row(
                // Test Info
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0,
                          MediaQuery.of(context).size.height * 0.02, 0.0, 0.0),
                      child: Image.asset(
                        'resources/$shortGlobalLevel/testinfo/'
                        '$shortGlobalLevel${shortGlobalTest}Information.png',
                        height: imageHeight,
                      ),
                    ),
                  ),
                ], // children
              ),
            ]));
  }
}

// This is the stateless widget that the main application instantiates.
// Arena_Diagram_Button is a method used to create the first two arena buttons
// to provide arena size to TestDiagrams.dart
// ignore: camel_case_types
class arena_Diagram_Button extends StatelessWidget {
  // To Diagrams
  const arena_Diagram_Button({
    Key key,
    this.shortArenaName,
    this.longArenaName,
  }) : super(key: key);
  final String shortArenaName;
  final String longArenaName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: MaterialButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.fromLTRB(
                  0.0,
                  MediaQuery.of(context).size.height * 0.01,
                  0.0,
                  MediaQuery.of(context).size.height * 0.01),
              minWidth: 0,
              onPressed: () {
                // set the Level global variable
                shortGlobalArena = shortArenaName;
                longGlobalArena = longArenaName;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestDiagrams()),
                ); // Navigator.push
              }, // on Pressed
              child: Text(
                '$longArenaName', // Introductory Level button text
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: stdFontSize,
                  //   height: 0.0,
                ),
              ),
            ),
          ),
        )
      ], // children
    );
  }
}

// This is the stateless widget that the main application instantiates.
// Arena_Audio_Button is the method to create the first two arena buttons
// to provide arena size to CallerAudios.dart
// ignore: camel_case_types
class arena_Audio_Button extends StatelessWidget {
  // To Caller Audios
  const arena_Audio_Button({
    Key key,
    this.shortArenaName,
    this.longArenaName,
  }) : super(key: key);
  final String shortArenaName;
  final String longArenaName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: MaterialButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.fromLTRB(
                  0.0,
                  MediaQuery.of(context).size.height * 0.015,
                  0.0,
                  MediaQuery.of(context).size.height * 0.015),
              minWidth: 0,
              onPressed: () {
                // set the Level global variable
                shortGlobalArena = shortArenaName;
                longGlobalArena = longArenaName;
                Navigator.push(
                  context,
                    '$shortGlobalLevel' != 'L4'
                    ? MaterialPageRoute(builder: (context) => CallerAudios())
                    :  MaterialPageRoute(builder: (context) => TestInfo()
                    ),
                ); // Navigator.push
              }, // on Pressed
              child: Text(
                '$shortGlobalLevel' == 'L4'
              ? 'No Level 4 Audios'
              : '$longArenaName', // Introductory Level button text
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: '$shortGlobalLevel' == 'L4'
                      ? Colors.red
                      : Color(0xff9b5f26),
                  fontSize: stdFontSize,
                  //   height: 0.0,
                ),
              ),
            ),
          ),
        )
      ], // children
    );
  }
}

// PdfButton is the method to create the two other documents buttons
// which provide a Pdf display of those documents
class PdfButton extends StatelessWidget {
  const PdfButton({
    Key key,
    this.displayURL,
    this.buttonName,
    this.type,
    this.appBarName,
    this.globalReturn,
  }) : super(key: key);
  final String displayURL;
  final String buttonName;
  final String type;
  final String appBarName;
  final String globalReturn;

  @override
  Widget build(BuildContext context) {
    print('PDF ');
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Flexible(
            child: MaterialButton(
                padding: EdgeInsets.fromLTRB(
                    0.0, MediaQuery.of(context).size.height * 0.009, 0.0, 0.0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfDisplay(
                          displayURL: displayURL,
                          type: type,
                          appBarName: appBarName,
                          globalReturn: 'TestInfo',
                        ),
                      )); // Navigator.push(
                }, // onPressed

                child: Text(
                  buttonName, // Introductory Level button text
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: stdFontSize,
                  ),
                )),
          )
        ] // children
            ));
  } // Widget build(
} // class ResourcesButton
