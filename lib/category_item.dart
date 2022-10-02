import 'package:flutter/material.dart';
import 'package:foodapp/models/category.dart';
import 'food_page.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  CategoryItem({required this.category});
  @override
  Widget build(BuildContext context) {
    Color _color = category.color;
    return InkWell(
      child: Container(
        child: Column(
          children: [
            Text(category.content, style: TextStyle(fontSize: 20))
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        decoration: BoxDecoration(
            color: _color,
            gradient: LinearGradient(
                colors: [
                  _color.withOpacity(0.6),
                  _color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
            borderRadius: BorderRadius.circular(20)
        ),
      ),
      splashColor: Colors.redAccent,
      onTap: (){
        //chuyển màn hình
        //Cách 1:
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context)=>FoodPage(category: category,))
        // );
        //Cách 2:
        Navigator.pushNamed(context, '/${FoodPage.routeName}', arguments: { "category": category });
      },
    );
  }
}