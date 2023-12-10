import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class ShuffleAlertDialog extends StatelessWidget {
  const ShuffleAlertDialog(
      {super.key,
      required this.image,
      required this.menu,
      required this.store});

  final String image;
  final String menu;
  final String store;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        width: double.infinity,
        height: 400,
        child: Stack(
          // fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                // border: Border.all(color: Colors.green, width: 2.0)
              ),
              child: ClipPath(
                clipper: ClipPathClipper(),
                child: Container(
                    decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21.5),
                      topRight: Radius.circular(21.5)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(image),
                  ),
                )),
              ),
            ),

            // top: 350,
            // left: 20,

            Positioned(
              top: 280,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(menu,
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: [
                      Text(store,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                          )),
                    ],
                  ),
                ],
              ),
            ),

            Positioned(
              top: 280.5,
              right: 70,
              child: Column(
                children: [SvgPicture.asset('images/Visit.svg')],
              ),
            ),

            Positioned(
              top: 335,
              left: 25,
              child: Row(
                children: [
                  SvgPicture.asset('images/Trailing Icon.svg'),
                  const Text('<> km away...',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromRGBO(254, 114, 76, 1))),
                  SizedBox(
                    width: 45,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        backgroundColor: HexColor('#FE724C')),
                    onPressed: () {},
                    child: const Text(
                      'Get Directions',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    //
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
