import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
//Staggered Grid View
//Comand flutter in project:
// flutter pub add flutter_masonry_view
// flutter_masonry_view: ^0.0.2
// flutter pub get

class MansoryViewScreen extends StatelessWidget {
  MansoryViewScreen({Key? key}) : super(key: key);

  final _items = [
    'lib/assets/image/p1.jpeg',
    'lib/assets/image/p2.jpg',
    'lib/assets/image/p3.jpg',
    'lib/assets/image/p1.jpeg',
    'lib/assets/image/p2.jpg',
    'lib/assets/image/p3.jpg',
    'lib/assets/image/p1.jpeg',
    'lib/assets/image/p2.jpg',
    'lib/assets/image/p3.jpg',
    'lib/assets/image/p1.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MasonryView(
        listOfItem: _items,
        numberOfColumn: 2,
        itemBuilder: (item) {
          return Image.asset(item);
        },
      ),
    );
  }
}