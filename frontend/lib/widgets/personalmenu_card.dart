import 'package:flutter/material.dart';
import 'package:frontend/SavedMealsNotifier.dart';
import 'package:frontend/widgets/card_feature.dart';
import 'package:provider/provider.dart';

// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1658713064117-51f51ecfaf69?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
//   'https://images.unsplash.com/photo-1658713064971-5fcef7dfe417?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
//   'https://lh3.googleusercontent.com/p/AF1QipNMEahLewbo25a4oskqqzezj_exa7zD4D1P2XZz=s1360-w1360-h1020',
//   'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGZvb2R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
//   'https://lh3.googleusercontent.com/p/AF1QipNC3oy2oKOLYR4KjRFmiy6rq3BQXMerHLfOGDkQ=s1360-w1360-h1020',
// ];
// final List<CardFeature> personalMenuCards = [
//   CardFeature(
//     title: 'Pork Sisig',
//     body: 'Western Plate',
//     image: imgList[0],
//     // isFavorite: false,
//   ),
//   CardFeature(
//     title: 'Kare-Kare',
//     body: 'Geewan',
//     image: imgList[1],
//     // isFavorite: false,
//   ),
//   CardFeature(
//     title: 'Oragon Ramen',
//     body: 'Maki Ramen by JPY',
//     image: imgList[2],
//     // isFavorite: false,
//   ),
//   CardFeature(
//     title: 'Garlic Cheese Pizza',
//     body: 'Sgimirita Pizza',
//     image: imgList[3],
//     //  isFavorite: false,
//   ),
//   CardFeature(
//     title: 'Spanish Latte',
//     body: 'Daily Joe',
//     image: imgList[4],
//     // isFavorite: false,
//   ),
// ];

class PersonalMenu extends StatefulWidget {
  @override
  _PersonalMenuState createState() => _PersonalMenuState();
}

class _PersonalMenuState extends State<PersonalMenu> {
// class PersonalMenu extends StatelessWidget {
//   PersonalMenu({
//     super.key,

//   });

  @override
  Widget build(BuildContext context) {
    List<CardFeature> personalMenuCards =
        Provider.of<SavedMealsNotifier>(context).personalMenuCards;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Personal Menu',
                      // Replace with your desired text style
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 100),
                  Text(
                    'See More >',
                    // Replace with your desired text style
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(254, 114, 76, 1)),
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
                      padding:
                          EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        // Wrap the CardFeature within Stack to position additional content
                        child: Stack(
                          children: [
                            personalMenuCards[
                                index], // Your existing CardFeature
                            // Additional Positioned widget
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
      ],
    );
  }
}
