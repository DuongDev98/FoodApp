import 'package:flutter/material.dart';
import 'package:foodapp/category_item.dart';
import 'fake_data.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);
  static const routeName = 'CategoryPage';
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
      children: FAKE_CATEGORIES.map((e) => CategoryItem(category: e)).toList()
    );
  }
}