import 'package:flutter/material.dart';

import '../details_screen.dart';
import '../models/books.dart';
import 'item_card.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  var itemsFound = []; // THE BOOKS IN THE GRID ARE STORED IN THIS VARIABLE

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                // "PESQUISAR" TEXT FIELD
                textInputAction: TextInputAction.search,
                onChanged: (texto) {
                  // CREATES A VARIABLE TO STORE THE RESULT BOOKS
                  var listBooksFound = Book.books
                      .where((book) => book.title
                          .toLowerCase()
                          .contains(texto.toLowerCase()))
                      .toList();
                  setState(() {
                    // CLEARS THE GRID AND REFRESH WITH THE NEW SEARCH RESULTS
                    itemsFound.clear();
                    itemsFound.addAll(listBooksFound);
                  });
                },
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                enableInteractiveSelection: true,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(100.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 25,
                  ),
                  labelText: 'Nome do livro: ',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                autofocus: true,
              ),
            ),
            Expanded(
              child: GridView.builder(
                // THE SEARCH RESULTS BOOKS
                itemCount: itemsFound.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.70,
                  crossAxisSpacing: 5.0,
                ),
                itemBuilder: (context, index) => ItemCard(
                  book: itemsFound[index],
                  press: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        book: itemsFound[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
