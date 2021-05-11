import 'package:flutter/material.dart';
import 'package:your_mind/details_screen.dart';
import 'package:your_mind/models/books.dart';

import 'item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: books.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.70,
          crossAxisSpacing: 5.0,
        ),
        itemBuilder: (context, index) => ItemCard(
          book: books[index],
          press: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(
                book: books[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
