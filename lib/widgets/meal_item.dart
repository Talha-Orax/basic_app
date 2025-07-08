import 'package:basic_app/model/meal.dart';
import 'package:basic_app/widgets/meal_item_trait.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Mealitem extends StatelessWidget {
  const Mealitem({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemTrait(
                                label: '${meal.duration} min',
                                icon: Icons.schedule),
                            const SizedBox(width: 12),
                            MealItemTrait(
                                label: meal.complexity.name
                                        .substring(0, 1)
                                        .toUpperCase() +
                                    meal.complexity.name.substring(1),
                                icon: Icons.work),
                            const SizedBox(width: 12),
                            MealItemTrait(
                                label: meal.affordability.name
                                        .substring(0, 1)
                                        .toUpperCase() +
                                    meal.affordability.name.substring(1),
                                icon: Icons.attach_money),
                          ],
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
