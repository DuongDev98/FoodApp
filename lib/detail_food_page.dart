import 'package:flutter/material.dart';
import 'package:foodapp/models/food.dart';

class DetailFoodPage extends StatelessWidget {
  Food food;
  DetailFoodPage({required this.food});
  static const String routeName = "DetailFoodPage";
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(food.name),
        ),
        body: SafeArea(
          child: Column(
            children: [
              FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: food.urlImage),
              Text("Ingredients:"),
              Expanded(
                  child: ListView.builder(
                    itemCount: food.ingredients.length,
                    itemBuilder: (context, index) {
                      String temp = food.ingredients[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text((index + 1).toString()),
                        ),
                        title: Text(temp),
                      );
                    },
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}