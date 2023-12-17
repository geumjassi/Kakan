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
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            )),
        child: Stack(
          // fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 165, // Adjust as needed
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                'images/finalunion.svg',
                fit: BoxFit.fill,
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
              ),
            ),
            Positioned(
              top: 230,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [SvgPicture.asset('images/Visit.svg')],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 330,
              left: 20,
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('images/Trailing Icon.svg'),
                      const Text('<> km away',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromRGBO(254, 114, 76, 1))),
                      SizedBox(
                        width: 50,
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

// class ClipPathClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     double width = size.width;
//     double height = size.height;

//     final path = Path();
//     //(0,0) 1.Point
//     // path.lineTo(0, height); //2.Point
//     // path.quadraticBezierTo(
//     //   width * 0.5, //3.Point --> width * 0.5, height - 100,
//     //   height - 100,
//     //   width, //4.Point --> width, height
//     //   height,
//     // );
//     // path.lineTo(width, 0); //5.Point
//     // path.close();
//     // Path path_0 = Path();
//     path.moveTo(0, size.height * 0.0033333);
//     path.quadraticBezierTo(size.width * 0.0148727, size.height * 0.6094167,
//         size.width * 0.1018000, size.height * 0.6589333);
//     path.cubicTo(
//         size.width * 0.2622455,
//         size.height * 0.6629667,
//         size.width * 0.6531182,
//         size.height * 0.6626958,
//         size.width * 0.8368909,
//         size.height * 0.6639500);
//     path.quadraticBezierTo(size.width * 0.9811455, size.height * 0.6777833,
//         size.width * 1.0018182, size.height * 0.9950000);
//     path.lineTo(size.width * 0.9981818, size.height * 0.0050000);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
