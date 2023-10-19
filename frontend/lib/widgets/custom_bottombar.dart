import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.white,
        child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: const Icon(Icons.bookmarks, size: 32),
                    onPressed: () {}),
                ElevatedButton(
                  onPressed: () {
                    // Add the function to be executed when the button is pressed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFE724C), // Background color
                    foregroundColor: Colors.white, // Text (label) color
                  ),
                  child: const Text('Shuffle'), // Button label
                ),
                IconButton(
                    icon: const Icon(Icons.add_box, size: 32),
                    onPressed: () {}),
              ],
            )));
  }
}
