import 'dart:math';

class Food {
  late final int id;
  final String name;
  final String urlImage;
  final Duration duration;
  final Complexity complexity;
  final List<String> ingredients;
  final int categoryId;

  Food({required this.name, required this.urlImage, required this.duration, required this.complexity,
    required this.categoryId, required this.ingredients }){
    id = Random().nextInt(1000);
  }
}

enum Complexity {
  Simple,
  Medium,
  Hard
}