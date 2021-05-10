import 'package:flutter/material.dart';
import 'package:your_mind/models/books.dart';

class ItemCard extends StatelessWidget {
  final Book book;
  final Function press;
  const ItemCard({
    Key key,
    this.book,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(5.0),
            height: 180,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              // color: Colors.grey,
            ),
            child: Image.asset(book.cover),
          ),
        ),
        Text(
          book.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          book.status,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: (book.status) == 'Disponível' ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}
