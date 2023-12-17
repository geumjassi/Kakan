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
        title: const Text(
          'Saved Meals',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
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
      final CardFeature card =
          savedMeals[index]; // Adjust index to account for the header
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Container(
          // color: Colors.white,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(15),
          //   color: Colors.white,
          //   boxShadow: [
          //     BoxShadow(
          //       color: Colors.black.withOpacity(0.2),
          //       offset: const Offset(2, 1),
          //       blurRadius: 4,
          //     )
          //   ],
          // ),
          height: 120,
          child: Container(
            // decoration: const BoxDecoration(color: Colors.white),
            child: Card(
              color: Colors.white,
              elevation: 4,
              child: Row(
                children: <Widget>[
                  //container for image
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      width: 120, // Adjust the width of the image container
                      height: double.infinity,
                      child: Image.network(
                        card.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        // color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              card.title,
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              card.body,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        card.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: card.isFavorite ? Colors.red : null,
                      ),
                      onPressed: () {
                        Provider.of<SavedMealsNotifier>(context, listen: false)
                            .toggleSavedMeals(card.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                fontWeight: FontWeight.bold,
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
