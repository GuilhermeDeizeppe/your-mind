import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:your_mind/models/books.dart';

import '../home_screen.dart';

class CreateBody extends StatefulWidget {
  @override
  _CreateBodyState createState() => _CreateBodyState();
}

class _CreateBodyState extends State<CreateBody> {
  String title; // STORES THE NEW BOOK'S TITLE
  String author; // STORES THE NEW BOOK'S AUTHOR
  String cover; // STORES THE NEW BOOK'S COVER ADDRESS
  String initialCover = 'assets/images/book.jpeg';
  PickedFile _coverFile;
  final ImagePicker _picker = ImagePicker();
  Book newBook; // NEW BOOK

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
                // NEW BOOK'S COVER
                Container(
                  height: 180,
                  width: 160,
                  padding: EdgeInsets.only(top: 10.0),
                  child: _coverFile == null
                      ? Image.asset(
                          initialCover.toString(),
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        )
                      : Image(image: FileImage(File(_coverFile.path))),
                ),
                TextButton(
                  // "SELECIONAR CAPA" TEXT BUTTON
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (builder) => bottomSheet(),
                      backgroundColor: Colors.grey.shade200,
                    );
                  },
                  child: Text(
                    'SELECIONAR CAPA',
                    style: TextStyle(color: Colors.indigo, fontSize: 12.0),
                  ),
                ),
                // "Título da Obra" TEXT FIELD
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
                // "Autor" TEXT FIELD
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
                // "Cadastrar" FLOATING BUTTON
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 15.0),
                  child: FloatingActionButton.extended(
                    onPressed: () => {
                      createBookButton(), // THIS METHOD HOLDS THE BUTTON LOGIC
                    },
                    label: Text(
                      'Cadastrar',
                      style: TextStyle(fontSize: 17),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 5.0,
                    splashColor: Colors.indigo,
                    icon: Icon(
                      Icons.check_circle_rounded,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    /* 
    THIS METHOD IS CALLED WHEN THE USER TAPS ON THE TEXT BUTTON "SELECIONAR
    CAPA".
    
    IT RETURNS A BOTTOM SHEET WHERE THE USER CAN CHOOSE WHETHER TO USE
    THE DEVICE CAMERA OR DEVICE GALLERY AS THE SOURCE OF THE NEW BOOK'S COVER.
    */

    return Container(
      height: 130.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            'Capa do livro',
            style: TextStyle(
                color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            // THIS ROW HOLDS THE TWO TEXT BUTTONS OF THE SHEET
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                // GALLERY BUTTON
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_outlined,
                      size: 23,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Galeria',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
              TextButton(
                // CAMERA BUTTON
                onPressed: () {
                  takePhoto(ImageSource.camera);
                  Navigator.of(context).pop();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 23,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Câmera',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    /* 
      THIS METHOD IS CALLED WHEN THE USER CHOOSED WHICH PHOTO PROVIDER TO USE.
      
      IT WORKS WITH THE DEVICE CAMERA SOURCE AND THE DEVICE GALLERY SOURCE.
    */
    final pickedFile = await _picker.getImage(source: source);

    if (pickedFile != null) {
      // IF THE PHOTO IS NOT NULL, THEN THE STATE IS SET.
      setState(() {
        _coverFile = pickedFile;
        cover = pickedFile.path;
      });
    }
  }

  void createBookButton() {
    // THIS METHOD HOLDS THE BUTTON LOGIC.
    //
    // IF ANY OF THE TEXT FIELDS IN THE CREATE BOOK'S PAGE IS NULL, EMPTY OR
    // EQUAL TO ZERO, AN ALERT DIALOG WILL POP UP ON THE SCREEN TO ALERT THE
    // USER.
    //
    // IF ALL THE FIELDS CONTAINS VALUES, THE BOOK WILL BE CORRECTLY CREATED
    // AND THE SCREEN WILL BE PUSHED TO APP'S HOME SCREEN.

    if (title != '' && title != '0' && title != null) {
      if (author != '' && author != '0' && author != null) {
        if (cover != '' && cover != '0' && cover != null) {
          newBook = new Book(cover, title, author, 'Disponível', null, '0');
          setState(() {
            Book.books.add(newBook);
          });

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          alertDialogNullFields();
        }
      } else {
        alertDialogNullFields();
      }
    } else {
      alertDialogNullFields();
    }
  }

  // ALERT DIALOG
  void alertDialogNullFields() {
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
            'Todos os campos são obrigatórios.',
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
