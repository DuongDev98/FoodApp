import 'package:flutter/material.dart';
import 'package:foodapp/detail_food_page.dart';
import 'package:foodapp/fake_data.dart';
import 'package:foodapp/models/category.dart';
import 'package:foodapp/models/food.dart';

class FoodPage extends StatelessWidget {
  static const routeName = 'FoodPage';
  late Category category;
  @override
  Widget build(BuildContext context) {
    Map<String, Category> args = ModalRoute.of(context)?.settings.arguments as Map<String, Category>;
    MapEntry entry = args.entries.firstWhere((element) => element.key == 'category');
    if (entry != null) {
      category = entry.value;
    }
    List<Food> lstFood = FAKE_FOODS.where((element) => element.categoryId == category.id).toList();
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Foods from ${category.content}'),
        ),
        body: Center(
          child: lstFood.length > 0 ? ListView.builder(
            itemCount: lstFood.length,
            itemBuilder: (context, index) {
              Food food = lstFood[index];
              String complexityStr = food.complexity == Complexity.Simple ? "Simple" : (food.complexity == Complexity.Medium ? "Medium": "Hard");
              return InkWell(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            clipBehavior: Clip.hardEdge,
                            child: FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: food.urlImage),
                          ),
                        ),
                        //time
                        Positioned(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.white, width: 2)
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.timer, color: Colors.white, size: 25,),
                                Text(food.duration.inMinutes.toString() + 'minutes', style: TextStyle(color: Colors.white, fontSize: 20),)
                              ],
                            ),
                          ),
                          top: 20,
                          left: 20,
                        ),
                        //mức độ khó dễ
                        Positioned(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Text(complexityStr, style: TextStyle(color: Colors.black, fontSize: 20),)
                              ],
                            ),
                          ),
                          top: 20,
                          right: 20,
                        ),
                        //Tên món ăn
                        Positioned(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Text(food.name, style: TextStyle(color: Colors.white, fontSize: 25),)
                              ],
                            ),
                          ),
                          bottom: 20,
                          right: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailFoodPage(food: food),));
                },
              );
            },) :
          Text("No food found!"),
        ),
      ),
    );
  }
}