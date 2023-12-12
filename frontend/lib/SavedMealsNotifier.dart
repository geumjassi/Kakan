import 'package:flutter/material.dart';
import 'package:frontend/widgets/card_feature.dart';

class SavedMealsNotifier extends ChangeNotifier {

  final List<CardFeature> _personalMenuCards = [
    CardFeature(
      title: 'Pork Sisig',
      body: 'Western Plate',
      image: 'https://images.unsplash.com/photo-1658713064117-51f51ecfaf69?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      canBeSaved: true,
      isFavorite: false,
      id: 0,
    ),
    CardFeature(
      title: 'Kare-Kare',
      body: 'Geewan',
      image: 'https://images.unsplash.com/photo-1658713064971-5fcef7dfe417?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
      canBeSaved: true,
      isFavorite: false,
      id: 1,
    ),
    CardFeature(
      title: 'Oragon Ramen',
      body: 'Maki Ramen by JPY',
      image: 'https://lh3.googleusercontent.com/p/AF1QipNMEahLewbo25a4oskqqzezj_exa7zD4D1P2XZz=s1360-w1360-h1020',
      canBeSaved: true,
      isFavorite: false,
      id: 2,
    ),
    CardFeature(
      title: 'Garlic Cheese Pizza',
      body: 'Sgimirita Pizza',
      image: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGZvb2R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
      canBeSaved: true,
      isFavorite: false,
      id: 3,
    ),
    CardFeature(
      title: 'Spanish Latte',
      body: 'Daily Joe',
      image: 'https://lh3.googleusercontent.com/p/AF1QipNC3oy2oKOLYR4KjRFmiy6rq3BQXMerHLfOGDkQ=s1360-w1360-h1020',
      canBeSaved: true,
      isFavorite: false,
      id: 4,
    ),
  ];

  List<CardFeature> get personalMenuCards => _personalMenuCards;

  void toggleSavedMeals(int index) {
    _personalMenuCards[index].isFavorite = !_personalMenuCards[index].isFavorite;
    notifyListeners();
  }

  bool isSaved(int index) {
    return _personalMenuCards[index].isFavorite;
  }
}
