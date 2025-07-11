import 'package:basic_app/screens/tabs.dart';
import 'package:basic_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

enum FilterEnum {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class Filters extends StatefulWidget {
  const Filters({super.key, required this.checkfilters});

  final Map<FilterEnum, bool> checkfilters;
  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.checkfilters[FilterEnum.glutenFree]!;
    _lactoseFree = widget.checkfilters[FilterEnum.lactoseFree]!;
    _vegan = widget.checkfilters[FilterEnum.vegan]!;
    _vegetarian = widget.checkfilters[FilterEnum.vegetarian]!;
  }

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

        /// Using PopScope to handle back navigation and return filter values to use them
        body: PopScope(
          /// as on going back we already poping the screen and parsing the result,so if we check the can pop as true it will double pop the screen
          canPop: false,

          ///
          onPopInvokedWithResult: (bool didPop, dynamic result) {
            if (didPop) {
              return;
            } else {
              // If the user pressed back, we can return the filter values
              Navigator.of(context).pop(
                {
                  FilterEnum.glutenFree: _glutenFree,
                  FilterEnum.lactoseFree: _lactoseFree,
                  FilterEnum.vegan: _vegan,
                  FilterEnum.vegetarian: _vegetarian,
                },
              );
            }
            // Close the filter screen
          },
          child: Column(
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
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
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
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
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
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
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
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                ),
                activeColor: Theme.of(context).colorScheme.primary,
                inactiveThumbColor:
                    Theme.of(context).colorScheme.onSurfaceVariant,
                contentPadding: const EdgeInsets.all(16),
              ),
            ],
          ),
        ));
  }
}
