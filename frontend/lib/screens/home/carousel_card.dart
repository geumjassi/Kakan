import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    super.key,
    required this.imgList,
    required this.item,
  });

  final List<String> imgList;
  final String item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(const Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            //   Image.asset(
            //     "images/kakan.png",
            //     fit: BoxFit.cover,
            //     width: 1000,
            //   ),
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'No. ${imgList.indexOf(item)} image',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
