import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../widgets/image_input.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final _titleController = TextEditingController();
  final _ingredientController = TextEditingController();
  final _stepsController = TextEditingController();

  File? _selectedImage;
  List<String> ingredients = [];
  List<String> steps = [];
  Affordability affordability = Affordability.affordable;
  Complexity complexity = Complexity.simple;
  late int duration;
  List<String> categories = [];
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Title",
              ),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 10),
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Add ingredient",
                    ),
                    controller: _ingredientController,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (ingredients.isNotEmpty) {
                          ingredients.removeLast();
                        }
                      });
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      String ingredient = _ingredientController.text;
                      setState(() {
                        ingredients.add(ingredient);
                      });
                      _ingredientController.clear();
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            const SizedBox(height: 5),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                ),
              ),
              child: ListView.builder(
                itemCount: ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(ingredients[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Add step",
                    ),
                    controller: _stepsController,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (steps.isNotEmpty) {
                          steps.removeLast();
                        }
                      });
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      String step = _stepsController.text;
                      setState(() {
                        ingredients.add(step);
                      });
                      _stepsController.clear();
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            const SizedBox(height: 5),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                ),
              ),
              child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(steps[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isGlutenFree = !isGlutenFree;
                    });
                  },
                  icon: Icon(isGlutenFree
                      ? Icons.breakfast_dining
                      : Icons.breakfast_dining_outlined),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isVegan = !isVegan;
                    });
                  },
                  icon: Icon(isVegan ? Icons.eco : Icons.eco_outlined),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isVegetarian = !isVegetarian;
                    });
                  },
                  icon: Icon(
                      isVegetarian ? Icons.egg_alt : Icons.egg_alt_outlined),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isLactoseFree = !isLactoseFree;
                    });
                  },
                  icon: Icon(
                      isLactoseFree ? Icons.icecream : Icons.icecream_outlined),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<Affordability>(
                  value: affordability,
                  onChanged: (Affordability? newValue) {
                    setState(() {
                      affordability = newValue!;
                    });
                  },
                  items: Affordability.values.map((Affordability item) {
                    return DropdownMenuItem<Affordability>(
                      value: item,
                      child: Text(
                        item.toString().split('.').last,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
                DropdownButton<Complexity>(
                  value: complexity,
                  onChanged: (Complexity? newValue) {
                    setState(() {
                      complexity = newValue!;
                    });
                  },
                  items: Complexity.values.map((Complexity item) {
                    return DropdownMenuItem<Complexity>(
                      value: item,
                      child: Text(
                        item.toString().split('.').last,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
