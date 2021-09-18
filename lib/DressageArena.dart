// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wdaa_dressage_tests_2017/Levels.dart';
var arenaImageHeight =0.0;

class DressageArena extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceHeight > 950
        ? deviceType = 'Tablet'
        : deviceType = 'Phone';
    Orientation deviceOrientation = MediaQuery.of(context).orientation;
    // deviceOrientation = "Orientation.portrait"

    // Set image height for both orientations on phones and tablets
    // deviceType = Phone
    deviceType == 'Phone' && deviceOrientation == Orientation.portrait
        ?  arenaImageHeight = MediaQuery.of(context).size.height * 0.78
        // ignore: unnecessary_statements
        :  null;
    deviceType == 'Phone' && deviceOrientation == Orientation.landscape
        ?  arenaImageHeight = MediaQuery.of(context).size.height * 0.7
        // ignore: unnecessary_statements
        : null;

    // deviceType = Tablet
    deviceType == 'Tablet' && deviceOrientation == Orientation.portrait
        ? arenaImageHeight = MediaQuery.of(context).size.height * 0.7
        // ignore: unnecessary_statements
        :  null;
    deviceType == 'Tablet' && deviceOrientation == Orientation.landscape
        ? arenaImageHeight = MediaQuery.of(context).size.height * 0.7
        // ignore: unnecessary_statements
        :  null;
    return MyHomePage(
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _itemImage = [
    Image.asset('assets/images/LargeArenacropped.png'),
    Image.asset('assets/images/SmallArenacropped.png'),
  ];

  int index = 0;

  tmpFunction() {
    Container(
      child: _itemImage[index],
    );
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
            icon: Icon(Icons.arrow_back, color:Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Levels()),
              ); // Navigator.push
            } // onPressed
            ),
        title: Text('Dressage Arena',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: stdFontSize,
        )
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 5),
            Container(
              child: _itemImage[index],
              height: arenaImageHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  // Large Arena
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  }, // on Pressed
                  child: Text(
                    "Large Arena",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: stdFontSize,
                      height: 0.0,
                    ),
                  ),
                ),
                MaterialButton(
                  // Small Arena
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  }, // onPressed
                  child: Text(
                    "Small Arena",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: stdFontSize,
                      height: 0.0,
                    ),
                  ),
                )
              ], // children
            ),
          ],
        ),
      ),
    );
  }
}
