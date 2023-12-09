import 'package:flutter/material.dart';

// class CardFeature extends StatelessWidget {
//   const CardFeature(
//       {super.key,
//       required this.title,
//       required this.body,
//       required this.image});

//   final String title;
//   final String body;
//   final String image;

class CardFeature extends StatefulWidget {
  const CardFeature({
    Key? key,
    required this.title,
    required this.body,
    required this.image,
  }) : super(key: key);

  final String title;
  final String body;
  final String image;

  @override
  _CardFeatureState createState() => _CardFeatureState();
}

class _CardFeatureState extends State<CardFeature> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: 200,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(2, 1),
                  blurRadius: 4,
                )
              ],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 8,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.image),
                            ),
                          ),
                          height: 140,
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                        Positioned(
                          top: 150,
                          left: null,
                          right: null,
                          bottom: null,
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  style: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  widget.body,
                                  style:
                                      const TextStyle(fontFamily: 'Montserrat'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])),
      ],
    );
  }
}

    // return Container(
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(8),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.grey.shade200,
    //         offset: const Offset(3, 4),
    //         blurRadius: 4,
    //       )
    //     ],
    //   ),
    //   child: Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(bottom: 10),
    //         child: Container(
    //           decoration: const BoxDecoration(
    //               borderRadius: BorderRadius.only(
    //             bottomLeft: Radius.circular(8),
    //             bottomRight: Radius.circular(8),
    //           )),
    //           child: Container(
    //             width: 200,
    //             height: 80,
    //             decoration: BoxDecoration(
    //               borderRadius: const BorderRadius.only(
    //                   topLeft: Radius.circular(8),
    //                   topRight: Radius.circular(8),
    //                   bottomLeft: Radius.circular(15),
    //                   bottomRight: Radius.circular(15)),
    //               image: DecorationImage(
    //                 fit: BoxFit.cover,
    //                 image: NetworkImage(image),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Text(
    //         title,
    //         style: TextStyle(fontWeight: FontWeight.bold),
    //       ),
    //       Text(
    //         body,
    //         style: TextStyle(),
    //       )
    //     ],
    //   ),
    // );

        