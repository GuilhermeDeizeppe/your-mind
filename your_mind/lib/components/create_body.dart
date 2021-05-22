import 'package:flutter/material.dart';
import 'package:your_mind/models/books.dart';

import '../home_screen.dart';

class CreateBody extends StatefulWidget {
  @override
  _CreateBodyState createState() => _CreateBodyState();
}

class _CreateBodyState extends State<CreateBody> {
  String title;
  String author;
  String cover;
  Book newBook;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Digite os dados do livro a ser cadastrado',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 35.0, 10.0, 15.0),
                  child: TextField(
                    onChanged: (title) {
                      this.title = title;
                    },
                    decoration: InputDecoration(
                      labelText: 'Título da Obra',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
                  child: TextField(
                    onChanged: (author) {
                      this.author = author;
                    },
                    decoration: InputDecoration(
                      labelText: 'Autor',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
                  child: TextField(
                    onChanged: (cover) {
                      this.cover = cover;
                    },
                    decoration: InputDecoration(
                      labelText: 'Capa',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
                  child: FloatingActionButton.extended(
                    onPressed: () => {
                      if (title != '' && title != '0' && title != null)
                        {
                          if (author != '' && author != '0' && author != null)
                            {
                              if (cover != '' && cover != '0' && cover != null)
                                {
                                  newBook = new Book(cover, title, author,
                                      'Disponível', null, '0'),
                                  setState(() {
                                    Book.books.add(newBook);
                                  }),
                                  // for (Book i in Book.books)  // teste pra saber se o novo livro estava sendo inserido corretamente.
                                  //   {
                                  //     print(i.title),
                                  //   }
                                }
                            }
                        },
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen())),
                    },
                    elevation: 5.0,
                    splashColor: Colors.indigo,
                    icon: Icon(
                      Icons.check_circle_rounded,
                      size: 25,
                    ),
                    label: Text(
                      'Cadastrar',
                      style: TextStyle(fontSize: 17),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
