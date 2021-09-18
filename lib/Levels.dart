// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wdaa_dressage_tests_2017/DressageArena.dart';
import 'package:wdaa_dressage_tests_2017/LevelsInfo.dart';
import 'package:wdaa_dressage_tests_2017/Resources.dart';

var longGloballevel = '';
/*
Initializes the globalLevel variable set below in
the onPressed section of the TextButtons
  globalLevel variables are:
    Introductory Level
    Basic Level
    Level 1
    Level 2
    Level 3
    level 4
    Level 5
 */

var shortGlobalLevel = '';
/*
Initializes the globalLevel variable set below in
the onPressed section of the TextButtons
  globalLevel variables are:
    Intro
    Basic
    L1
    L2
    L3
    L4
    L5
*/
var imageHeight = 0.0;
var levelsImageHeight = 0.0;
var deviceHeight = 0.0;
var deviceType ='';
var stdFontSize = 0.0;
var deviceWidth = 0.0;
class Levels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    deviceHeight > 950
        ? deviceType = 'Tablet'
        : deviceType = 'Phone';
    Orientation deviceOrientation = MediaQuery.of(context).orientation;

    // Set imageHeight for both orientations on phones and tablets
    // device = Phone
    deviceType == 'Phone' && deviceOrientation == Orientation.portrait
        ? imageHeight = MediaQuery.of(context).size.height * 0.45

        : null;
    // Orientation Landscape
    deviceType == 'Phone' && deviceOrientation == Orientation.landscape
        ? imageHeight = MediaQuery.of(context).size.height * 0.8
        : null;

    // deviceType = Tablet
    deviceType == 'Tablet' && deviceOrientation == Orientation.portrait
        ? imageHeight = MediaQuery.of(context).size.height * 0.3
        : null;
    // Orientation Landscape
    deviceType == 'Tablet' && deviceOrientation == Orientation.landscape
        ? imageHeight = MediaQuery.of(context).size.height * 0.5
        : null;

    // Set levelsImageHeight for both orientations on phones and tablets
    // for the Levels top image.
    // device = Phone
    deviceType == 'Phone' && deviceOrientation == Orientation.portrait
        ? levelsImageHeight = MediaQuery.of(context).size.height * 0.22
        : //null;
    // Orientation Landscape
    deviceType == 'Phone' && deviceOrientation == Orientation.landscape
        ? levelsImageHeight = MediaQuery.of(context).size.height * 0.6
        : null;

    // deviceType = Tablet
    deviceType == 'Tablet' && deviceOrientation == Orientation.portrait
        ? levelsImageHeight = MediaQuery.of(context).size.height * 0.3
        : null;
    // Orientation Landscape
    deviceType == 'Tablet' && deviceOrientation == Orientation.landscape
        ? levelsImageHeight = MediaQuery.of(context).size.height * 0.5
        : null;

    // Set stdFontSize for both orientations on phones and tablets
    // device = Phone
    deviceType == 'Phone' && deviceOrientation == Orientation.portrait
        ? stdFontSize = MediaQuery.of(context).size.height * 0.032
        : null;

    // For tall narrow phones
    deviceWidth > 400 && deviceOrientation == Orientation.portrait
        ? stdFontSize = 22
        : null;

    // Orientation Landscape
    deviceType == 'Phone' && deviceOrientation == Orientation.landscape
        ? stdFontSize = MediaQuery.of(context).size.height * 0.08
        : null;

    // deviceType = Tablet
    deviceType == 'Tablet' && deviceOrientation == Orientation.portrait
        ? stdFontSize = MediaQuery.of(context).size.height * 0.03
        : null;
    // Orientation Landscape
    deviceType == 'Tablet' && deviceOrientation == Orientation.landscape
        ? stdFontSize = MediaQuery.of(context).size.width * 0.03
        : null;

    /*print('deviceType = $deviceType');
    print('deviceOrientation = $deviceOrientation');
    print('deviceHeight = $deviceHeight');
    print('deviceWidth = ${MediaQuery.of(context).size.width}');
    print('stdFontSize = $stdFontSize');*/


    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0,
          title: Text('2017 WDAA Dressage Tests',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: stdFontSize,
          )
         )
        ),


        // Set up the screen in the proper order and permit scrolling
        body: ListView(
          children: <Widget>[
            // WDAA Logo image
            Image.asset(
              'assets/images/WDAA_Logo_400.jpg',
              fit: BoxFit.contain,
              height: levelsImageHeight,
            ),
            SizedBox(height: 5),

            // Start the rows of TextButtons
            LevelsTextButton(
                shortLevelName: 'intro', longLevelName: 'Introductory Level'),

            LevelsTextButton(
                shortLevelName: 'basic', longLevelName: 'Basic Level'),

            LevelsTextButton(shortLevelName: 'L1', longLevelName: 'Level 1'),

            LevelsTextButton(shortLevelName: 'L2', longLevelName: 'Level 2'),

            LevelsTextButton(shortLevelName: 'L3', longLevelName: 'Level 3'),

            LevelsTextButton(shortLevelName: 'L4', longLevelName: 'Level 4'),

            // Dressage Arena Screen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0.0,
                      MediaQuery.of(context).size.height * 0.02, 0.0, 0.0),
                  child: MaterialButton(
                   //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DressageArena()),
                      );
                    },
                    child: Text(
                      'Dressage Arena',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: stdFontSize,
                    //    height: 0.0,
                      ),
                    ),
                  ),
                ),
              ], // children
            ),

            // Resources & Information Screen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0.0,
                      MediaQuery.of(context).size.height * 0.02, 0.0, 0.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Resources()),
                      ); // Navigator.push
                    }, // onPressed
                    child: Text(
                      'Resources & Information',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: stdFontSize,
                        //height: 0.0,
                      ),
                    ),
                  ),
                ),
              ], // children
            ),

            // Bottom copyright section
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding:  EdgeInsets.fromLTRB(10.0,
                        MediaQuery.of(context).size.height * 0.02, 10.0, 10.0),
                    child: Text(
                      '© 2017 - 2021 Western Dressage Association® of America (WDAA).'
                      ' Reprinted with the permission of WDAA. All rights reserved. '
                      'Reproduction without permission is prohibited by law. WDAA is '
                      'not responsible for any errors or omissions in the publication '
                      'or for the use of its copyrighted materials in an unauthorized '
                      'manner.  Diagrams © 2017 Legend Enterprises. Flutter V0.1.6',
                      softWrap: true,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 14),
                    ), // Text
                  ), // Container
                ),
              ], // children
            ),
          ],
        ),
      );
  } // widget build
} // class Levels

// This is the stateless widget that the main application instantiates.
// LevelsTextButton
class LevelsTextButton extends StatelessWidget {
  const LevelsTextButton({
    Key key,
    this.shortLevelName,
    this.longLevelName,
  }) : super(key: key);

  final String shortLevelName;
  final String longLevelName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
         // alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.fromLTRB(0.0,
                MediaQuery.of(context).size.height * 0.02, 0.0, 0.0),
            child: MaterialButton(
              onPressed: () {
                // set the Level global variable
                shortGlobalLevel = shortLevelName;
                longGloballevel = longLevelName;
                stdFontSize = stdFontSize;
                imageHeight = imageHeight;
                deviceHeight = deviceHeight;
                deviceType = deviceType;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LevelsInfo()),
                ); // Navigator.push
              }, // on Pressed
              child: Text(
                '2017 $longLevelName', // Introductory Level button text
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: stdFontSize,
                 // height: 0.0,
                ),
              ),
            ),
          ),
        )
      ], // children
    );
  }
}
