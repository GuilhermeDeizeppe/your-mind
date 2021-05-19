import 'package:flutter/material.dart';
import 'package:your_mind/details_screen.dart';

import 'item_card.dart';
import '../models/books.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: Book.books.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.70,
          crossAxisSpacing: 5.0,
        ),
        itemBuilder: (context, index) => ItemCard(
          book: Book.books[index],
          press: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                book: Book.books[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
