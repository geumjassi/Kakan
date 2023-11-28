import 'package:flutter/material.dart';

class ShuffledItemDisplay extends StatelessWidget {
  const ShuffledItemDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Curved Divider'),
      // ),
      body: Column(
        children: [
          // Image container
          ClipPath(
            clipper: ClipPathClipper(),
            child: Container(
              color: Colors.blue,
              height: 400,
              child: const Center(
                child: Text('Content'),
              ),
            ),
          ),
          //
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [Text("menu title")],
                ),
                Row(
                  children: [Text("Restaurant")],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ClipPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;

    final path = Path();
    //(0,0) 1.Point
    // path.lineTo(0, height); //2.Point
    // path.quadraticBezierTo(
    //   width * 0.5, //3.Point --> width * 0.5, height - 100,
    //   height - 100,
    //   width, //4.Point --> width, height
    //   height,
    // );
    // path.lineTo(width, 0); //5.Point
    // path.close();
    // Path path_0 = Path();
    path.moveTo(0, size.height * 0.0033333);
    path.quadraticBezierTo(size.width * 0.0148727, size.height * 0.6094167,
        size.width * 0.1018000, size.height * 0.6589333);
    path.cubicTo(
        size.width * 0.2622455,
        size.height * 0.6629667,
        size.width * 0.6531182,
        size.height * 0.6626958,
        size.width * 0.8368909,
        size.height * 0.6639500);
    path.quadraticBezierTo(size.width * 0.9811455, size.height * 0.6777833,
        size.width * 1.0018182, size.height * 0.9950000);
    path.lineTo(size.width * 0.9981818, size.height * 0.0050000);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: CurvedDividerScreen(),
//   ));
// }
