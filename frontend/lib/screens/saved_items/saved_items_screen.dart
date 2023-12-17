import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/SavedMealsNotifier.dart';
import 'package:frontend/widgets/card_feature.dart';
import 'package:provider/provider.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  State<SaveScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Meals'),
      ),
      body: Consumer<SavedMealsNotifier>(
        builder: (context, savedMealsNotifier, child) {
          List<CardFeature> savedMeals =
              Provider.of<SavedMealsNotifier>(context)
                  .personalMenuCards
                  .where((card) => card.isFavorite == true)
                  .toList();
          return savedMeals.isNotEmpty
              ? buildSavedMealsList(savedMeals)
              : buildEmptyList(context);
        },
      ),
    );
  }
}

Widget buildSavedMealsList(List<CardFeature> savedMeals) {
  return ListView.builder(
    itemCount: savedMeals.length, // +1 for the header
    itemBuilder: (context, index) {
      // if (index == 0) {
      //   return Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Text(
      //       'Saved Meals',
      //       style: TextStyle(
      //         fontSize: 24,
      //         fontFamily: 'Montserrat',
      //         fontWeight: FontWeight.bold,
      //         color: Colors.black,
      //       ),
      //     ),
      //   );
      // }

      final CardFeature card =
          savedMeals[index]; // Adjust index to account for the header
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        height: 120,
        child: Card(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 80, // Adjust the width of the image container
                height: double.infinity,
                child: Image.network(
                  card.image,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        card.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        card.body,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  card.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: card.isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  // Handle onPressed action
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget buildEmptyList(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height * 0.4,
          ),
          child: SvgPicture.asset(
            'images/emptystate.svg',
            fit: BoxFit.contain,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "No saved meals.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
              ),
            ),
            Text(
              "Tyler's not here. Tyler went away. Tyler's gone.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
