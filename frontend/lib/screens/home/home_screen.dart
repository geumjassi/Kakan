import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/widgets/card_feature.dart';
import 'package:frontend/widgets/custom_appbar.dart';
import 'package:frontend/widgets/custom_bottombar.dart';
import 'package:frontend/widgets/follow_restau.dart';
import 'package:frontend/widgets/personalmenu_card.dart';
import 'package:frontend/widgets/saved_meals.dart';

import 'carousel_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<String> imgList = [
      'https://images.unsplash.com/photo-1658713064117-51f51ecfaf69?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      'https://images.unsplash.com/photo-1658713064971-5fcef7dfe417?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      'https://images.unsplash.com/photo-1616070829624-884057de0b29?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60',
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGZvb2R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
      'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fGZvb2R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
    ];

    final List<CarouselCard> featured = [
      CarouselCard(image: imgList[0], price: "P109.00", menu: "Pork Sisig", store: "Kitchen Garage"),
      CarouselCard(image: imgList[1], price: "P109.00", menu: "Pork Sisig", store: "Kitchen Garage"),
      CarouselCard(image: imgList[2], price: "P109.00", menu: "Pork Sisig", store: "Kitchen Garage"),
      CarouselCard(image: imgList[3], price: "P109.00", menu: "Pork Sisig", store: "Kitchen Garage"),
      CarouselCard(image: imgList[4], price: "P109.00", menu: "Pork Sisig", store: "Kitchen Garage"),
    ];

    final List<CardFeature> personalMenuCards = [
      CardFeature(
        title: 'Title 1',
        body: 'Body 1',
        image: imgList[0],
      ),
      CardFeature(
        title: 'Title 2',
        body: 'Body 2',
        image: imgList[1],
      ),
      CardFeature(
        title: 'Title 3',
        body: 'Body 3',
        image: imgList[2],
      ),
      CardFeature(
        title: 'Title 4',
        body: 'Body 4',
        image: imgList[3],
      ),
      CardFeature(
        title: 'Title 5',
        body: 'Body 5',
        image: imgList[4],
      ),
    ];

    return Scaffold(
      appBar: const CustomAppBar(),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const CustomBottomAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      //Background
                      Container(
                        child: SvgPicture.asset('images/TopHalfBG.svg',
                            alignment: Alignment.topCenter,
                            // width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width),
                      ),
                      Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: MediaQuery.of(context).size.height * 0.3,
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                            ),
                            items: featured,
                          ),
                          //SearchBar
                        ],
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //     height:
                  //         20), //space between search bar and personal menu row
                  PersonalMenu(),
                  FollowedRestaurants(),
                  SavedMeals()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: const CustomAppBar(),
//         body: Stack(children: [
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.7,
//             child: ClipPath(
//               clipper: CurvedBackgroundClipper(),
//               child: Container(
//                 color: Colors.amber[700],
//               ),
//             ),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               // Section 1 (Carousel Slider)
//               Expanded(
//                 flex: 2,
//                 child: Stack(
//                   children: [
//                     CarouselSlider(
//                       items: [
//                         // Replace with carousel items (e.g., images)
//                         Container(
//                           color: Colors.blue,
//                           child: const Center(child: Text('Image 1')),
//                         ),
//                         Container(
//                           color: Colors.green,
//                           child: const Center(child: Text('Image 2')),
//                         ),
//                         Container(
//                           color: Colors.red,
//                           child: const Center(child: Text('Image 3')),
//                         ),
//                       ],
//                       options: CarouselOptions(
//                         height: double.infinity,
//                         enlargeCenterPage: true,
//                         enableInfiniteScroll: true,
//                         autoPlay: true,
//                       ),
//                     ),
//                     Positioned.fill(
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           color: Colors.transparent,
//                           /* Add any decoration you might need for the carousel */
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Section 2 (Other content)
//               Expanded(
//                 flex: 3,
//                 child: Container(
//                   padding: const EdgeInsets.all(16.0),
//                   child: const Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Text in First Row',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       // Other content in section 2 goes here
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 280, // Adjust the position of the search bar
//                 left: 0,
//                 right: 0,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Container(
//                     height: 50, // Set your preferred height
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8.0),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           spreadRadius: 1,
//                           blurRadius: 3,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: const Center(
//                       child: Text(
//                           'Search Bar'), // Replace with your search bar widget
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ]));
//   }
// }

// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1658713064117-51f51ecfaf69?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
//   'https://images.unsplash.com/photo-1658713064971-5fcef7dfe417?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
//   'https://images.unsplash.com/photo-1616070829624-884057de0b29?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60',
//   'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGZvb2R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
//   'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fGZvb2R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
// ];
// final List<Widget> imageSliders = imgList
//     .map((item) => Container(
//           child: Container(
//             margin: EdgeInsets.all(5.0),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                 child: Stack(
//                   children: <Widget>[
//                     Image.network(item, fit: BoxFit.cover, width: 1000.0),
//                     Positioned(
//                       bottom: 0.0,
//                       left: 0.0,
//                       right: 0.0,
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               Color.fromARGB(200, 0, 0, 0),
//                               Color.fromARGB(0, 0, 0, 0)
//                             ],
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topCenter,
//                           ),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 10.0, horizontal: 20.0),
//                         child: Text(
//                           'No. ${imgList.indexOf(item)} image',
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )),
//           ),
//         ))
//     .toList();

// return Scaffold(
//   extendBodyBehindAppBar: true,
//   appBar: const CustomAppBar(),
//   bottomNavigationBar: const CustomBottomAppBar(),
//   body: Stack(
//         children: [
//           // First Half: Curved Background with Color
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.7, // screen height
//             child: Stack(
//               children: [
//                 ClipPath(
//                   clipper:
//                       CurvedBackgroundClipper(), // Custom clipper for the curve effect
//                   child: Container(
//                     color: Colors.amber[700], // Background color
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Second Half: Content (Carousel)
//           Positioned(
//             top: MediaQuery.of(context).size.height *
//                 0.20, // Adjust this value as needed
//             left: 0,
//             right: 0,
//             child: CarouselSlider(
//               options: CarouselOptions(
//                 aspectRatio: 1.5,
//                 viewportFraction: 0.9,
//                 enlargeCenterPage: true,
//                 enlargeStrategy: CenterPageEnlargeStrategy.height,
//                 enableInfiniteScroll: false,
//                 initialPage: 2,
//                 autoPlay: true,
//               ),
//               items: imageSliders,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Custom Clipper for the curved background
// class CurvedBackgroundClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, size.height * 0.7); // Start from the top-left
//     path.quadraticBezierTo(size.width / 2, size.height, size.width,
//         size.height * 0.7); // Create the curve
//     path.lineTo(size.width, 0); // Close the path
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
