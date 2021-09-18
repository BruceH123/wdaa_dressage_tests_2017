// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wdaa_dressage_tests_2017/Levels.dart';
import 'package:wdaa_dressage_tests_2017/WebDisplay.dart';
import 'package:wdaa_dressage_tests_2017/PdfDisplay.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class Resources extends StatelessWidget {
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
              title: Text(
                'Resources & Information',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: stdFontSize,
               ),
             )
            ),
            body: ListView(children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),

              // Start the rows of text buttons
              ResourcesButton(
                  displayURL:
                      'https://westerndressageassociation.org/wdaa-tests/',
                  buttonName: 'Western Dressage Tests',
                  type: 'web',
                  appBarName: 'WDAA Tests'),

              ResourcesButton(
                  displayURL: 'https://westerndressageassociation.org/'
                      'western-dressage-rules-tests/',
                  buttonName: 'WDAA Rules & Guidelines',
                  type: 'web',
                  appBarName: 'WDAA Rules & Guidelines'),

              ResourcesButton(
                  displayURL: 'https://dressageillustrated.com',
                  buttonName: 'Dressage Illustrated web site',
                  type: 'web',
                  appBarName: 'Dressage Illustrated'),

              ResourcesButton(
                  displayURL:
                      'https://dressageillustrated.com/pages/'
                          'dressage-test-learning-guide',
                  buttonName: 'Test Learning Guide',
                  type: 'webPdf',
                  appBarName: 'Test Learning Guide'),

              // Contact us button
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                          child: MaterialButton(
                              padding: EdgeInsets.fromLTRB(
                                  0.0,
                                  MediaQuery.of(context).size.height * 0.025,
                                  0.0,
                                  0.0),
                              child: Text(
                                'Contact Us',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: stdFontSize,
                                ),
                              ),
                              onPressed: () async {
                                final Email email = Email(
                                  body:
                                      'Replace this text with your email message',
                                  subject:
                                      'Email from 2017 WDAA Dressage Tests app',
                                  recipients: ['info@dressageillustrated.com'],
                                );
                                await FlutterEmailSender.send(email);
                              } // onPressed
                              ))
                    ] // children
                    ),
              )
            ]));
  } // Widget build
}

// This is the stateless widget that the main application instantiates.
// ResourcesButton is a method used to created all the buttons in Resources
// Named routes are used to navigate to other screens
class ResourcesButton extends StatelessWidget {
  const ResourcesButton({
    Key key,
    this.displayURL,
    this.buttonName,
    this.type,
    this.appBarName,
  }) : super(key: key);
  final String displayURL;
  final String buttonName;
  final String type;
  final String appBarName;

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
                    MediaQuery.of(context).size.height * 0.025,
                    0.0,
                    MediaQuery.of(context).size.height * 0.025),
                onPressed: () {
                  // Navigate to next screen
                  if (type == 'web') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebDisplay(
                            displayURL: displayURL,
                            appBarName: appBarName,
                            key: null,
                          ),
                        )); // Navigator.push
                  } // if

                  if (type == 'webPdf') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebDisplay(
                            displayURL: displayURL,
                            //    type: type,
                            appBarName: appBarName, key: null,
                          ),
                        )); // Navigator.push
                  } // if

                  if (type == 'pdfAsset') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfDisplay(
                              displayURL: displayURL,
                              type: type,
                              appBarName: appBarName),
                        )); // Navigator.push
                  } // if
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
