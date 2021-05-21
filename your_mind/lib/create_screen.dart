import 'package:flutter/material.dart';
import 'package:your_mind/components/NavBar.dart';

import 'components/create_body.dart';

class CreateBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Cadastrar Livro',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: CreateBody(),
      bottomNavigationBar: NavBar(),
    );
  }
}
