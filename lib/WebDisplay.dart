import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:wdaa_dressage_tests_2017/Levels.dart';
import 'package:wdaa_dressage_tests_2017/Resources.dart';

class WebDisplay extends StatefulWidget {
  final String displayURL;
  final String appBarName;

  WebDisplay(
      {required Key key, required this.displayURL, required this.appBarName})
      : super(key: key);

  @override
  _HomeState createState() => _HomeState(displayURL, appBarName);
} // end class HomePage

class _HomeState extends State<WebDisplay> {
  final String displayURL;
  final String appBarName;

//  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  _HomeState(this.displayURL, this.appBarName);

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
                  MaterialPageRoute(builder: (context) => Resources()),
                ); // Navigator.push
              } // onPressed
              ),
          title: Text(
            '$appBarName',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: stdFontSize,
            ),
          )),
      body: Center(
        child: MaterialButton(
          child: Text(
            'Press for $appBarName',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: stdFontSize),
          ),
          onPressed: () => _launchURL(context, displayURL: displayURL),
        ),
      ),
    );
  } // Widget build(BuildContext context)

  void _launchURL(BuildContext context, {required String displayURL}) async {
    await launch('$displayURL',
        customTabsOption: CustomTabsOption(
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
        ) // CustomTabsOption
        ); // await launch
  }
}
