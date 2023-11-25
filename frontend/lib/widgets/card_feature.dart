import 'package:flutter/material.dart';

class CardFeature extends StatelessWidget {
  const CardFeature({
    super.key, required this.title, required this.body, required this.image
  });

  final String title;
  final String body;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(3, 4),
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              width: 120,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
              ),
            ),
          ),
          Text(title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            body,
            style: TextStyle(),
          )
        ],
      ),
    );
  }
}
