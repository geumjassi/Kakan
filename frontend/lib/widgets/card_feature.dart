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
    // required this.isFavorite
  }) : super(key: key);

  final String title;
  final String body;
  final String image;
  // final bool isFavorite;

  @override
  _CardFeatureState createState() => _CardFeatureState();
}

class _CardFeatureState extends State<CardFeature> {
  bool _isTap = false;
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
        Positioned(
          top: 5, // Adjust top position as needed
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text("P109.00"),
              ),
              // CONTAINER FOR TOP RIGHT
              Stack(
                alignment: Alignment.center,
                fit: StackFit.loose,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    width: 30,
                    height: 30,
                  ),
                  Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: _isTap ? Colors.red[400] : Colors.grey,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _isTap = !_isTap;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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

        