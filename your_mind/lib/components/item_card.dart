import 'package:flutter/material.dart';
import 'package:your_mind/models/books.dart';

class ItemCard extends StatefulWidget {
  final Book book;
  final Function press;

  const ItemCard({
    Key key,
    this.book,
    this.press,
  }) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Column(
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
              child: Image.asset(widget.book.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
            child: Text(
              widget.book.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              widget.book.status,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: (widget.book.status) == 'Disponível'
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }
}
