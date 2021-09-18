// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wdaa_dressage_tests_2017/Levels.dart';
import 'package:wdaa_dressage_tests_2017/TestInformation.dart';
import 'package:wdaa_dressage_tests_2017/pdfDisplay.dart';

var longGlobalTest = '';
/*
Initializes the globalLevel variable set below in
the onPressed section of the TextButtons
  globalTest variables are:
    Test 1
    Test 2
    Test 3
    Test 4
    Test 5
 */

var shortGlobalTest = '';
/*
Initializes the globalLevel variable set below in
the onPressed section of the TextButtons
  globalTest variables are:
    T1
    T2
    T3
    T4
    T5
*/

var globalReturn = '';


class LevelsInfo extends StatelessWidget {
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
                    MaterialPageRoute(builder: (context) => Levels()),
                  ); // Navigator.push
                } // onPressed
                ),
            title: Text('Levels Information',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: stdFontSize,
            )
            ),
          ),

          // Set up the screen in the proper order and permit scrolling
          body: ListView(
            children: <Widget>[
              // Add the two top Text Labels as Rows
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0,
                          MediaQuery.of(context).size.height * 0.02, 0.0, 0.0),
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
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
                      child: Text('Test Selection',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: stdFontSize,
                          )), // Text
                    ),
                  ),
                ], // children
              ),

              // Add the four Test Buttons as rows
              TestTextButton(shortTestName: 'T1', longTestName: 'Test 1'),

              TestTextButton(shortTestName: 'T2', longTestName: 'Test 2'),

              TestTextButton(shortTestName: 'T3', longTestName: 'Test 3'),

              TestTextButton(shortTestName: 'T4', longTestName: 'Test 4'),

              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0,
                          MediaQuery.of(context).size.height * 0.04, 0.0, 0.0),
                      child: Text('Level Information',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: stdFontSize,
                          )), // Text
                    ),
                  ),
                ], // children
              ),

              LevelsInfoElementButton(
                  displayURL: 'resources/$shortGlobalLevel/elements'
                      '/${shortGlobalLevel}Purpose.pdf',
                  buttonName: 'Purpose',
                  type: 'pdfAsset',
                  appBarName: 'Purpose'),

              LevelsInfoElementButton(
                  displayURL: 'resources/$shortGlobalLevel/elements'
                      '/${shortGlobalLevel}CollectiveMarks.pdf',
                  buttonName: 'Collective Marks',
                  type: 'pdfAsset',
                  appBarName: 'Collective Marks'),

              LevelsInfoElementButton(
                displayURL: 'resources/$shortGlobalLevel/scoringshts/'
                    '$shortGlobalLevel-MUSICAL-FREESTYLE.pdf',
                buttonName: 'Musical Freestyle',
                type: 'pdfAsset',
                appBarName: 'Musical Freestyle',
              ),

              LevelsInfoElementButton(
                  displayURL: 'resources/$shortGlobalLevel/elements'
                      '/${shortGlobalLevel}Key.pdf',
                  buttonName: 'Diagram Key',
                  type: 'pdfAsset',
                  appBarName: 'Diagram Key'),
            ],
          ),
        );
  } // Widget build
} // class

// This is the stateless widget that the main application instantiates.
// TestTextButton is a method used to create the first four test buttons
// in Levels Info
class TestTextButton extends StatelessWidget {
  const TestTextButton({
    Key key,
    this.shortTestName,
    this.longTestName,
  }) : super(key: key);

  final String shortTestName;
  final String longTestName;

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
              // minWidth: 0,
              onPressed: () {
                // set the Level global variable
                shortGlobalTest = shortTestName;
                longGlobalTest = longTestName;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestInfo()),
                ); // Navigator.push
              }, // on Pressed
              child: Text(
                '$longTestName', // Introductory Level button text
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
// LevelsInfoElementsButton is a method used to create the last four
// buttons in Levels Info to display the PDFs.
class LevelsInfoElementButton extends StatelessWidget {
  const LevelsInfoElementButton({
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
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Flexible(
            child: MaterialButton(
                padding: EdgeInsets.fromLTRB(
                    0.0,
                    MediaQuery.of(context).size.height * 0.015,
                    0.0,
                    MediaQuery.of(context).size.height * 0.015),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfDisplay(
                          displayURL: displayURL,
                          type: type,
                          appBarName: appBarName,
                          globalReturn: 'LevelsInfo',
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
