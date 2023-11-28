import 'package:flutter/material.dart';
import 'package:frontend/widgets/card_feature.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1658713064117-51f51ecfaf69?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
  'https://images.unsplash.com/photo-1658713064971-5fcef7dfe417?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
  'https://images.unsplash.com/photo-1616070829624-884057de0b29?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60',
  'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGZvb2R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
  'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fGZvb2R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
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

class PersonalMenu extends StatelessWidget {
  PersonalMenu({
    super.key,
  });

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
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 100),
                  Text(
                    'View All',
                    // Replace with your desired text style
                    style: TextStyle(fontSize: 15),
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
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: personalMenuCards.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: personalMenuCards[index],
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
