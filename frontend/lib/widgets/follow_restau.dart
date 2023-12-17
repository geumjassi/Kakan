import 'package:flutter/material.dart';
import 'package:frontend/widgets/card_feature.dart';

final List<String> imgList = [
  'https://www.bobmarlin.ph/wp-content/uploads/2015/01/bm-facade-2014.jpg',
  'https://lh3.googleusercontent.com/p/AF1QipOcDUxwCYztOyAJis3j5ft5u1RAUk4bc4coH5my=s1360-w1360-h1020',
  'https://lh3.googleusercontent.com/p/AF1QipNPmq-MKnP3fnkOXbmO9e_RH7ju_LqoJQTMRPBW=s1360-w1360-h1020',
  'https://images.unsplash.com/photo-1682218033121-ac3a5b33b7e0?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://lh3.googleusercontent.com/p/AF1QipOinEfiski1asFIc7x8dXGS7k2JLdW0KCVHrUcT=s1360-w1360-h1020',
];
final List<CardFeature> followedRestaurantCards = [
  CardFeature(
    title: 'Bob Marlin',
    body: 'Magsaysay Avenue, Naga City',
    price: '',
    image: imgList[0],
    isFavorite: false,
    canBeSaved: false,
  ),
  CardFeature(
    title: 'Soledad Restaurant',
    body: 'La Piazza, Magsaysay Avenue',
    price: '',
    image: imgList[1],
    isFavorite: false,
    canBeSaved: false,
  ),
  CardFeature(
    title: 'Chef Buster Cuisine',
    body: 'Blumentritt St, Naga, Camarines Sur',
    price: '',
    image: imgList[2],
    isFavorite: false,
    canBeSaved: false,
  ),
  CardFeature(
    title: 'Jollibee',
    body: 'Gen.Luna Street, Naga City',
    price: '',
    image: imgList[3],
    isFavorite: false,
    canBeSaved: false,
  ),
  CardFeature(
    title: 'The Coffee Table',
    body: 'ADC Building, Magsaysay Ave, Naga',
    price: '',
    image: imgList[4],
    isFavorite: false,
    canBeSaved: false,
  ),
];

class FollowedRestaurants extends StatelessWidget {
  const FollowedRestaurants({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                      'Restaurants You Follow',
                      // Replace with your desired text style
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 40),
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
                  itemCount: followedRestaurantCards.length,
                  itemBuilder: (context, index) {
                    // final title = followedRestaurantCards[index];
                    // final body = followedRestaurantCards[index];
                    return Padding(
                      padding:
                          EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                      child: followedRestaurantCards[index],
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
