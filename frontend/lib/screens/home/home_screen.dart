import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/SavedMealsNotifier.dart';
import 'package:frontend/screens/add_items/add_items_screen.dart';
import 'package:frontend/widgets/alert_dialog.dart';
import 'package:frontend/widgets/card_feature.dart';
import 'package:frontend/widgets/custom_appbar.dart';
import 'package:frontend/widgets/custom_bottombar.dart';
import 'package:frontend/widgets/follow_restau.dart';
import 'package:frontend/widgets/personalmenu_card.dart';
import 'package:frontend/widgets/saved_meals.dart';
import 'package:frontend/widgets/saved_meals.dart';
import 'package:provider/provider.dart';

import 'carousel_card.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearchBarUsed = false;
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
      CarouselCard(
          image: imgList[0],
          price: "145.00",
          menu: "Pork Sisig",
          store: "Western Plate"),
      CarouselCard(
          image: imgList[1],
          price: "120.00",
          menu: "Kare-Kare",
          store: "Geewan"),
      CarouselCard(
          image: imgList[2],
          price: "350.00",
          menu: "Ramen",
          store: "Ichiban Ramen"),
      CarouselCard(
          image: imgList[3],
          price: "168.00",
          menu: "Garlic Cheese Pizza",
          store: "Sgimirita Pizza"),
      CarouselCard(
          image: imgList[4],
          price: "40.00",
          menu: "Ice Cream",
          store: "7-Eleven"),
    ];

    List<CardFeature> personalMenuCards =
        Provider.of<SavedMealsNotifier>(context).personalMenuCards;

    // final List<CardFeature> personalMenuCards = [
    //   CardFeature(
    //     title: 'Title 1',
    //     body: 'Body 1',
    //     image: imgList[0],
    //   ),
    //   CardFeature(
    //     title: 'Title 2',
    //     body: 'Body 2',
    //     image: imgList[1],
    //   ),
    //   CardFeature(
    //     title: 'Title 3',
    //     body: 'Body 3',
    //     image: imgList[2],
    //   ),
    //   CardFeature(
    //     title: 'Title 4',
    //     body: 'Body 4',
    //     image: imgList[3],
    //   ),
    //   CardFeature(
    //     title: 'Title 5',
    //     body: 'Body 5',
    //     image: imgList[4],
    //   ),
    // ];

    return Scaffold(
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      //Background
                      Container(
                        child: SvgPicture.asset('images/TopHalfBG.svg',
                            alignment: Alignment.topCenter,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.10,
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: MediaQuery.of(context).size.height * 0.4,
                              autoPlay: true,
                              viewportFraction: 0.6,
                              aspectRatio: 0.0,
                              enlargeCenterPage: true,
                              // enlargeStrategy: CenterPageEnlargeStrategy.height,
                            ),
                            items: featured,
                          ),
                          const SizedBox(
                              height:
                                  15), //space between search bar and CAROUSEL
                          //SearchBar
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), // Shadow color
                                      spreadRadius: 2, // Spread radius
                                      blurRadius: 4, // Blur radius
                                      offset: Offset(
                                          0, 2), // Offset in the x, y direction
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  style: TextStyle(
                                      // fontSize: 8.0,
                                      height: 1.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'Search',
                                    hintText: 'Search...',
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Color.fromRGBO(254, 114, 76, 1),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          width: 0.0, style: BorderStyle.none),
                                    ),
                                  ),
                                  // Handle onChanged or onSubmitted as needed
                                  // onChanged: (value) {
                                  //   // Do something when the text changes
                                  // },
                                  // onSubmitted: (value) {
                                  //   // Do something when the user submits the text
                                  // },
                                  onTap: () {
                                    setState(() {
                                      _isSearchBarUsed = true;
                                    });
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: PersonalMenu()),
                  Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: FollowedRestaurants()),
                  Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SavedMeals()),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 80)]),
        height: 60,
        child: BottomAppBar(
          elevation: 10,
          notchMargin: 7,
          color: Colors.white,
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 100.0),
                child: IconButton(
                  icon: SvgPicture.asset('images/heart.svg',
                      height: 50, width: 50, fit: BoxFit.scaleDown),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: IconButton(
                  icon: SvgPicture.asset('images/addbutton.svg',
                      height: 50, width: 50, fit: BoxFit.scaleDown),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddItemScreen()),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: !_isSearchBarUsed,
        child: FloatingActionButton.extended(
          label: const Row(
            children: [
              Text(
                'Shuffle',
                style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
              ),
              Icon(
                Icons.shuffle,
                color: Colors.white,
              ),
            ],
          ),
          icon: Container(),
          backgroundColor: Color.fromRGBO(254, 114, 76, 1),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(17))),
          onPressed: () {
            int randomIndex = Random().nextInt(personalMenuCards.length);
            showDialog(
                context: context,
                builder: (ctxt) => ShuffleAlertDialog(
                      image: personalMenuCards[randomIndex].image,
                      menu: personalMenuCards[randomIndex].title,
                      store: personalMenuCards[randomIndex].body,
                    ));
          },
        ),
      ),
    );
  }
}
