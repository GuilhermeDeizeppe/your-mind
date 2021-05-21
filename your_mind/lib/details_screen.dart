import 'package:flutter/material.dart';
import 'package:your_mind/components/NavBar.dart';
import 'package:your_mind/components/details_body.dart';
import 'package:your_mind/models/books.dart';

import 'home_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Book book;

  const DetailsScreen({Key key, this.book}) : super(key: key);
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
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen())),
              splashColor: Colors.indigo,
              color: Colors.black,
              tooltip: 'Voltar',
            );
          },
        ),
      ),
      body: DetailsBody(book: book),
      bottomNavigationBar: NavBar(),
    );
  }
}
