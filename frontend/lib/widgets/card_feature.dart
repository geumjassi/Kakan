import 'package:flutter/material.dart';

class CardFeature extends StatelessWidget {
  const CardFeature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Column(
          children: [
            Container(child: SizedBox()), //image ,
            Column(
              children: [Row(), Row()],
            )
          ],
        ),
        //Top Part
        Row(
          children: [
            const Text("A"),
            ElevatedButton(
              onPressed: () {},
              child: null,
            )
          ],
        )
      ],
    ));
  }
}
