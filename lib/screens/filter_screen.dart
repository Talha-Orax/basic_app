import 'package:basic_app/screens/tabs.dart';
import 'package:basic_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          iconTheme: IconThemeData(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          title: Text(
            'Filters',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          centerTitle: true,
        ),
        drawer: MainDrawer(onSelectScreen: (identifier) {
          if (identifier == "Settings") {
            Navigator.pop(context); // Close the drawer
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => TabScreen())); // Close the drawer
          }
        }),
        body: Column(
          children: [
            SwitchListTile(
              onChanged: (ischecked) {
                setState(() {
                  _glutenFree = ischecked;
                });
              },
              value: _glutenFree,
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              inactiveThumbColor:
                  Theme.of(context).colorScheme.onSurfaceVariant,
              contentPadding: const EdgeInsets.all(16),
            ),
            //lactose free
            SwitchListTile(
              onChanged: (ischecked) {
                setState(() {
                  _lactoseFree = ischecked;
                });
              },
              value: _lactoseFree,
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                'Only include Lactose-free meals.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              inactiveThumbColor:
                  Theme.of(context).colorScheme.onSurfaceVariant,
              contentPadding: const EdgeInsets.all(16),
            ),
            //is vegan
            SwitchListTile(
              onChanged: (ischecked) {
                setState(() {
                  _vegan = ischecked;
                });
              },
              value: _vegan,
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                'Only Vegan meals.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              inactiveThumbColor:
                  Theme.of(context).colorScheme.onSurfaceVariant,
              contentPadding: const EdgeInsets.all(16),
            ),
            //is vegetarian
            SwitchListTile(
              onChanged: (ischecked) {
                setState(() {
                  _vegetarian = ischecked;
                });
              },
              value: _vegetarian,
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                'Only Vegetarian meals.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.primary,
              inactiveThumbColor:
                  Theme.of(context).colorScheme.onSurfaceVariant,
              contentPadding: const EdgeInsets.all(16),
            ),
          ],
        ));
  }
}
