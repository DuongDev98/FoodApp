import 'package:flutter/material.dart';
import 'package:foodapp/food_page.dart';
import 'category_page.dart';
import 'detail_food_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      initialRoute: '/',
      routes: {
        '/${CategoryPage.routeName}': (context) => const CategoryPage(),
        '/${FoodPage.routeName}': (context) => FoodPage(),
        // '/${DetailFoodPage.routeName}': (context) => DetailFoodPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Food Categories"),
          centerTitle: true,
        ),
        body: const SafeArea(child: CategoryPage()),
        ),
      );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}