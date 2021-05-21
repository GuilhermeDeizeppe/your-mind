import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_mind/components/NavBar.dart';

import 'components/Body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Mind',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.indigo,
        elevation: 1.0,
        centerTitle: true,
      ),
      body: Body(),
      bottomNavigationBar: NavBar(),
      backgroundColor: Colors.white,
    );
  }
}
