import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/meal_extended.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen(
      {super.key,
      required this.mealExtended,
      required this.isFavorite,
      required this.onToggleFavorite});

  final MealExtended mealExtended;
  final bool isFavorite;
  final void Function(MealExtended meal) onToggleFavorite;

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  bool isFavorite = false;

  void onToggleFavorite(MealExtended mealExtended) {
    widget.onToggleFavorite(widget.mealExtended);
    setState(() {
      isFavorite = mealExtended.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    Meal meal = widget.mealExtended.meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(widget.mealExtended);
            },
            icon: widget.mealExtended.isFavorite
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final steps in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
