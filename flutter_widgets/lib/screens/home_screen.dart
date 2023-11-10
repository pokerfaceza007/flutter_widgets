import 'package:flutter/material.dart';
import 'package:flutter_widgets/screens/column_screen.dart';
import 'package:flutter_widgets/screens/gridveiw_screen.dart';
import 'package:flutter_widgets/screens/mansoryview.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: Icon(Icons.menu, size: 24, color: Colors.white),
        title: Text(
          'Flutter Widgets',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        actions: [Icon(Icons.search, size: 24, color: Colors.white)],
      ),
      body: MansoryViewScreen(),
    );
  }
}
