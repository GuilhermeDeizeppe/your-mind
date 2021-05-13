import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:your_mind/details_screen.dart';

import 'models/books.dart';

class UpdateScreen extends StatefulWidget {
  final Book book;

  const UpdateScreen({Key key, this.book}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState(book);
}

class _UpdateScreenState extends State<UpdateScreen> {
  final Book book;
  String newDate;
  String newResp;

  _UpdateScreenState(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUpdateScreen(),
      backgroundColor: Colors.white,
      body: updateScreenBody(),
      // bottomNavigationBar: NavBar(),
    );
  }

  AppBar appBarUpdateScreen() {
    return AppBar(
      title: Text(
        'Atualizar Cadastro',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      shadowColor: Colors.indigo,
      elevation: 0,
      toolbarHeight: 70.0,
      centerTitle: true,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsScreen(book: book))),
            },
            splashColor: Colors.indigo,
            color: Colors.black,
            tooltip: 'Voltar',
          );
        },
      ),
    );
  }

  updateScreenBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      color: Colors.white,
      child: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
                child: Text(
                  book.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 15.0),
                child: Text(
                  book.date != '0' ? 'Retirado em: ' + book.date : 'Em estoque',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 15.0),
                child: Text(
                  book.clientName != '0'
                      ? 'Responsável: ' + book.clientName
                      : 'Responsável: não consta',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 15.0),
                child: Text(
                  'Status: ' + book.status,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        book.status == 'Disponível' ? Colors.green : Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 35.0,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (name) {
                    book.clientName = name;
                  },
                  decoration: InputDecoration(
                    labelText: book.clientName == '0'
                        ? 'Responsável'
                        : book.clientName,
                    border: OutlineInputBorder(),
                  ),
                  enabled: book.clientName == '0' ? true : false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  onChanged: (date) {
                    book.date = date;
                  },
                  decoration: InputDecoration(
                    labelText: book.date != '0'
                        ? 'Data de devolução'
                        : 'Data de retirada',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 35.0,
                width: MediaQuery.of(context).size.width,
              ),
              FloatingActionButton.extended(
                onPressed: () => {
                  updateStatus(),
                },
                elevation: 5.0,
                splashColor:
                    book.status == 'Disponível' ? Colors.red : Colors.green,
                icon: Icon(
                  Icons.check_circle_rounded,
                  size: 25,
                ),
                label: Text(
                  'Salvar',
                  style: TextStyle(fontSize: 17),
                ),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void updateStatus() {
    if (book.date == '0') {
      setState(() {
        book.date = '0';
      });

      if (book.clientName == '0' ||
          book.clientName == '' ||
          book.clientName == book.clientName) {
        setState(() {
          book.clientName = '0';
          book.status = 'Disponível';
        });
      }

      if (book.clientName != '0') {
        setState(() {
          book.clientName = '0';
        });
      }
    } else if (book.date != '0') {
      setState(() {
        book.date = book.date;
      });

      if (book.clientName != '0') {
        setState(() {
          book.clientName = book.clientName;
          book.status = 'Indisponível';
        });
      }

      if (book.clientName == '0' || book.clientName == '') {
        setState(() {
          book.date = '0';
          book.clientName = '0';
          book.status = 'Disponível';
        });
      }
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(book: book),
      ),
    );
  }
}