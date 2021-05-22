import 'package:flutter/material.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  String pesquisa;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(3.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: MediaQuery.of(context).size.height / 6.5,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textInputAction: TextInputAction.search,
                onChanged: (texto) {
                  pesquisa = texto;
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
          ],
        ),
      ),
    );
  }
}
