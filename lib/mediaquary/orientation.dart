import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Run(),
    debugShowCheckedModeBanner: false,
  ));
}

class Run extends StatelessWidget {
  var orientation, height, width;

  @override
  Widget build(BuildContext context) {
    // getting the orientation of the app
    orientation = MediaQuery.orientationOf(context);
    //size of the window
    //size = MediaQuery.of(context).size;
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Orientation Media Query"),
        backgroundColor: Colors.purple,
      ),
      // checking the orientation
      body: orientation == Orientation.portrait
          ? Container(
        color: Colors.blue,
        height: height / 2,
        width: width / 2,
      )
          : Container(
        height: height / 2,
        width: width / 2,
        color: Colors.red,
      ),
    );
  }
}

//Change or lock device orientation
// void main() {
//     WidgetsFlutterBinding.ensureInitialized();
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     runApp(MaterialApp(home: Run()));
// }