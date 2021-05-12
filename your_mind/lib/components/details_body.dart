import 'package:flutter/material.dart';
import 'package:your_mind/models/books.dart';
import 'package:your_mind/update_screen.dart';

class DetailsBody extends StatefulWidget {
  final Book book;

  const DetailsBody({Key key, this.book}) : super(key: key);

  @override
  _DetailsBodyState createState() => _DetailsBodyState(book);
}

class _DetailsBodyState extends State<DetailsBody> {
  final Book book;

  String newDate = 'vazio';

  _DetailsBodyState(this.book);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(5.0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
        child: ListView(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    book.cover,
                    height: 250,
                    width: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    book.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  child: Text(
                    'Autor: ' + book.author,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                  child: Text(
                    book.date != '0'
                        ? 'Retirado em: ' + book.date
                        : 'Em estoque',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
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
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                  child: Text(
                    'Status: ' + book.status,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: book.status == 'Disponível'
                          ? Colors.green
                          : Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
              width: MediaQuery.of(context).size.width,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateScreen(book: book))),
                  elevation: 5.0,
                  splashColor:
                      book.status == 'Disponível' ? Colors.red : Colors.green,
                  icon: Icon(
                    Icons.save_rounded,
                    size: 25,
                  ),
                  label: Text(
                    'Alterar',
                    style: TextStyle(fontSize: 17),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
              ],
            )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SizedBox(
            //       height: 30.0,
            //       width: MediaQuery.of(context).size.width / 1.5,
            //       child: TextField(
            //         // inputFormatters: [], CRIAR DEPOIS A MÁSCARA PARA ACEITAR APENAS DATAS
            //         keyboardType: TextInputType.datetime,
            //         onChanged: (text) {
            //           newDate = text;
            //         },
            //         decoration: InputDecoration(
            //           labelText: book.date != '0'
            //               ? 'Data de devolução'
            //               : 'Data de retirada',
            //           border: OutlineInputBorder(),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       IconButton(
            //           icon: Icon(Icons.save_rounded),
            //           splashColor: Colors.indigo,
            //           iconSize: 30,
            //           onPressed: () {
            //             button_logic();
            //           }),
            //       GestureDetector(
            //         child: Text(
            //           'Salvar',
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontSize: 17,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         onTap: () {},
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // void button_logic() {
  //   if (newDate != 'vazio' && newDate != '') {
  //     if (book.status == 'Disponível') {
  //       if (newDate != '0') {
  //         setState(() {
  //           book.status = 'Indisponível';
  //         });
  //       }
  //     } else if (newDate != '0') {
  //       if (book.status != 'Disponível') {
  //         setState(() {
  //           book.status = 'Indisponível';
  //         });
  //       }
  //     } else if (book.status == 'Indisponível') {
  //       if (newDate != '0') {
  //         setState(() {
  //           book.status = 'Indisponível';
  //         });
  //       } else if (newDate == '0') {
  //         setState(() {
  //           book.status = 'Disponível';
  //         });
  //       }
  //     }
  //     setState(() {
  //       book.date = newDate;
  //     });
  //   }

  //   if (newDate != '0' && newDate != 'vazio' && newDate != '') {
  //     Stack(
  //       children: [
  //         Container(
  //           color: Colors.transparent,
  //           child: SizedBox(
  //             height: MediaQuery.of(context).size.height / 2,
  //             width: MediaQuery.of(context).size.width,
  //             child: Container(
  //               color: Colors.green,
  //               child: Column(
  //                 children: [
  //                   Text('Digite o nome do responsável pelo livro'),
  //                   TextField(
  //                     onChanged: (resp) {
  //                       String newResp = resp;
  //                     },
  //                     decoration: InputDecoration(
  //                       labelText: 'Responsável',
  //                       border: OutlineInputBorder(),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     );
  //   }
  // }
}
