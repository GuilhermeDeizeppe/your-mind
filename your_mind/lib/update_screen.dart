import 'package:flutter/material.dart';

import 'models/books.dart';

class UpdateScreen extends StatefulWidget {
  final Book book;

  const UpdateScreen({Key key, this.book}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState(book);
}

class _UpdateScreenState extends State<UpdateScreen> {
  final Book book;

  _UpdateScreenState(this.book);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text(
        book.title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 45,
        ),
      ),
    );
  }
}
