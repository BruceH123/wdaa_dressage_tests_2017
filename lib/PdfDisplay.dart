// @dart=2.9
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:wdaa_dressage_tests_2017/Levels.dart';
import 'package:wdaa_dressage_tests_2017/LevelsInfo.dart';
import 'package:wdaa_dressage_tests_2017/TestInformation.dart';
import 'package:flutter/cupertino.dart';

class PdfDisplay extends StatefulWidget {
  final String displayURL;
  final String type;
  final String appBarName;
  final String globalReturn;

  PdfDisplay(
      {Key key,
      @required this.displayURL,
      this.type,
      this.appBarName,
      this.globalReturn})
      : super(key: key);

  @override
  _HomeState createState() =>
      _HomeState(displayURL, type, appBarName, globalReturn);
} // end class HomePage

class _HomeState extends State<PdfDisplay> {
  final String displayURL;
  final String type;
  final String appBarName;
  final String globalReturn;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  _HomeState(this.displayURL, this.type, this.appBarName, this.globalReturn);

  @override
  void initState() {
    super.initState();
  }

  @override
  // ignore: must_call_super
  void dispose() {
    super.initState();
  }

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
                if (globalReturn == 'LevelsInfo') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LevelsInfo()),
                  ); // Navigator.push
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TestInfo()),
                  ); // Navigator.push
                } // if/else
              } // onPressed
              ),
          title: Text('$appBarName',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: stdFontSize,
              )),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
          child:
                (type == 'webPdf')
              ? SfPdfViewer.network(displayURL, canShowPaginationDialog: true)
              :
               (type == 'pdfAsset')
              ? SfPdfViewer.asset(displayURL, canShowPaginationDialog: false )
              : null,
          key: _pdfViewerKey,
        ));
  }
} // end class HomeState
