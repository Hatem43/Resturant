import 'package:flutter/material.dart';

enum Complexity{
  Simple,
  Challenging,
  Hard,
}
enum Affordability{
  affordable,
  Pricey,
  Luxurious,
}

class Meal{
  final String id;
  final List<String> categories;
  final List<String> steps;
  final String title;
  final String imageUrl;
  final List<String> ingerdients;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGluttenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.ingerdients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGluttenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.categories,
    @required this.isVegetarian,
});

}
