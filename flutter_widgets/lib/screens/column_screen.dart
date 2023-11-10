import 'package:flutter/material.dart';

class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(Icons.person, size: 30, color: Colors.white),
        Icon(Icons.search, size: 30, color: const Color.fromARGB(255, 8, 8, 8)),
        const Text('Sample data' , style: TextStyle(
          fontSize: 30,
        ),),
        Container(width: 100, height: 200,color: Colors.yellowAccent,),
        Container(width: 100, height: 200,color: Colors.greenAccent,),
      ],
    );
  }
}