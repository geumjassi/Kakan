import 'package:flutter/material.dart';
import 'package:frontend/widgets/card_feature.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1658713064117-51f51ecfaf69?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
  'https://images.unsplash.com/photo-1658713064971-5fcef7dfe417?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
  'https://lh3.googleusercontent.com/p/AF1QipNMEahLewbo25a4oskqqzezj_exa7zD4D1P2XZz=s1360-w1360-h1020',
  'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGZvb2R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
  'https://lh3.googleusercontent.com/p/AF1QipNC3oy2oKOLYR4KjRFmiy6rq3BQXMerHLfOGDkQ=s1360-w1360-h1020',
];
final List<CardFeature> personalMenuCards = [
  CardFeature(
    title: 'Pork Sisig',
    body: 'Western Plate',
    image: imgList[0],
  ),
  CardFeature(
    title: 'Kare-Kare',
    body: 'Geewan',
    image: imgList[1],
  ),
  CardFeature(
    title: 'Oragon Ramen',
    body: 'Maki Ramen by JPY',
    image: imgList[2],
  ),
  CardFeature(
    title: 'Garlic Cheese Pizza',
    body: 'Sgimirita Pizza',
    image: imgList[3],
  ),
  CardFeature(
    title: 'Spanish Latte',
    body: 'Daily Joe',
    image: imgList[4],
  ),
];

class PersonalMenu extends StatefulWidget {
  @override
  _PersonalMenuState createState() => _PersonalMenuState();
}

class _PersonalMenuState extends State<PersonalMenu> {
  bool _isTap = false;

// class PersonalMenu extends StatelessWidget {
//   PersonalMenu({
//     super.key,

//   });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Personal Menu',
                    // Replace with your desired text style
                    style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                  ),
                  const SizedBox(width: 100),
                  Text(
                    'View All',
                    // Replace with your desired text style
                    style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: personalMenuCards.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        // Wrap the CardFeature within Stack to position additional content
                        child: Stack(
                          children: [
                            personalMenuCards[
                                index], // Your existing CardFeature

                            // Additional Positioned widget
                            Positioned(
                              top: 5, // Adjust top position as needed
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            color: _isTap
                                                ? Colors.red[400]
                                                : Colors.grey,
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
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        // Row(
        //   children: [
        //     Expanded(
        //       child: SizedBox(
        //         width: double.infinity,
        //         height: 250,
        //         child: ListView.builder(
        //           scrollDirection: Axis.horizontal,
        //           itemCount: personalMenuCards.length,
        //           itemBuilder: (context, index) {
        //             return Padding(
        //               padding: EdgeInsets.all(8.0),
        //               child: personalMenuCards[index],
        //             );
        //           },
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
