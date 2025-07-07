import 'package:flutter/material.dart';

class CatergoryScreen extends StatelessWidget {
  const CatergoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Category Screen',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 241, 161, 100),
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 50,
            mainAxisExtent: 50,
          ),
          children: [
            Text(
              "1",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              "2",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              "3",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              "4",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              "5",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              "6",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ));
  }
}
