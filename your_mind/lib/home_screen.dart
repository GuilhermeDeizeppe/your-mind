import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/Body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Your Mind',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.indigo,
        elevation: 1,
        toolbarHeight: 70.0,
      ),
      body: Body(),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        color: Colors.white,
        child: Container(
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu_book),
                    onPressed: () {},
                    iconSize: 35,
                  ),
                  Text(
                    'Biblioteca',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                    iconSize: 35,
                  ),
                  Text(
                    'Buscar',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {},
                    iconSize: 35,
                  ),
                  Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
