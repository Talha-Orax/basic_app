import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood,
                    size: 64, color: Theme.of(context).colorScheme.onPrimary),
                const SizedBox(width: 18),
                Text(
                  'Cooking Up',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 20),
            leading: const Icon(
              Icons.restaurant_rounded,
              size: 28,
            ),
            title: Text(
              'Meals',
              style: TextStyle(
                fontSize: 26,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 20),
            leading: const Icon(
              Icons.settings,
              size: 28,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 26,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            onTap: () {
              onSelectScreen('Settings');
            },
          ),
        ],
      ),
    );
  }
}
