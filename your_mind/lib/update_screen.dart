import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:your_mind/details_screen.dart';

import 'models/books.dart';

class UpdateScreen extends StatefulWidget {
  final Book book; // BOOK FROM THE ITEMCARD'S GRID

  const UpdateScreen({Key key, this.book}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState(book);
}

class _UpdateScreenState extends State<UpdateScreen> {
  final Book book; // STORES THE BOOK FROM THE ITEMCARD'S GRID
  DateTime newDate; // VARIABLE TO WORK WITH DATE PICKER
  String newResp; // VARIBLE TO WORK WITH TEXT FIELD

  _UpdateScreenState(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUpdateScreen(),
      backgroundColor: Colors.white,
      body: updateScreenBody(),
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
                  // TEXT RETIRADO EM / EM ESTOQUE
                  book.date != null
                      ? 'Retirado em: ' +
                          DateFormat(DateFormat.YEAR_NUM_MONTH_DAY, "pt-Br")
                              .format(book.date)
                      : 'Em estoque',
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
                  // TEXT RESPONSÁVEL
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
                  // TEXT BOOK STATUS
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
                  // "Responsável" TEXT FIELD
                  onChanged: (name) {
                    newResp = name;
                  },
                  decoration: InputDecoration(
                    labelText: book.clientName == '0'
                        ? 'Responsável'
                        : book.clientName,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  enabled: book.clientName == '0' ? true : false,
                ),
              ),
              SizedBox(
                height: 15.0,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton.extended(
                  // DATE PICKER BUTTON
                  onPressed: () async {
                    newDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                  },
                  label: Text(book.date != null
                      ? 'Data de devolução'
                      : 'Data de retirada'),
                  icon: Icon(Icons.calendar_today_outlined),
                  elevation: 0,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  splashColor: Colors.white,
                  heroTag: 'date',
                ),
              ),
              SizedBox(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
              ),
              // "Salvar" BUTTON
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
    // IN THIS METHOD, IF THE newDate IS BEFORE book.date, THE book.date WILL
    // UPDATE AND STORE THE VALUE OF newDate.

    // IF newDate OR newResp ARE NULL, AN ALERT DIALOG WILL POP UP ON THE SCREEN
    // INFORMING THAT THESE VALUES ARE REQUIRED

    // CHEKING IF THE book.clientName IS NULL, ZERO OR EMPTY. IF FALSE, THEN THE
    // newResp TAKES THE VALUE OF book.clientName.
    if (book.date != null &&
        book.clientName != '0' &&
        book.clientName != null) {
      newResp = book.clientName;
    }

    //CHECKING IF newDate OR newResp ARE NULL
    if (newDate == null || newResp == null || newResp == '') {
      alertDialogNullDateOrName();
    }
    if (book.date == null) {
      if (newDate != null) {
        if (newResp != book.clientName &&
            newResp != '' &&
            newResp != '0' &&
            newResp != null) {
          // SETTING STATE AND PUSHING BACK TO THE DETAILS PAGE
          setState(() {
            book.date = newDate;
            book.clientName = newResp;
            book.status = 'Indisponível';
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(book: book),
            ),
          );
        }
      }
    } else if (newDate != null) {
      if (newDate.isAfter(book.date) || newDate.isAtSameMomentAs(book.date)) {
        // CHEKING IF THE BOOK HAS BEEN RETURNED TO THE LIBRARY
        setState(() {
          book.date = null;
          book.clientName = '0';
          book.status = 'Disponível';
        });
      } else if (newDate.isBefore(book.date)) {
        book.date = newDate;
      }
      // CHEKING IF ALL THE INPUTS ARE NOT NULL. IF TRUE, PUSHES BACK TO THE
      // DETAILS PAGE
      if (newDate != null && newResp != null && newResp != '') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(book: book),
          ),
        );
      }
    }
  }

  // ALERT DIALOG
  void alertDialogNullDateOrName() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red.shade300,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          title: Text(
            'Atenção',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'A data e o nome do responsável são atributos obrigatórios.',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ],
        );
      },
    );
  }
}
