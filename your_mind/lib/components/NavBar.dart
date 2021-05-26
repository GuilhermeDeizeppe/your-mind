import 'package:flutter/material.dart';
import 'package:your_mind/create_screen.dart';
import 'package:your_mind/home_screen.dart';
import 'package:your_mind/search_screen.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.white,
      child: Container(
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: [
                IconButton(
                  // "BIBLIOTECA" BUTTON
                  icon: Icon(Icons.menu_book),
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                  iconSize: 35,
                  splashColor: Colors.indigo,
                  tooltip: 'Biblioteca',
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
                  // "BUSCAR" BUTTON
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  iconSize: 35,
                  splashColor: Colors.indigo,
                  tooltip: 'Buscar',
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
                  // "CRIAR" BUTTON
                  icon: Icon(Icons.add_circle_outline_sharp),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => CreateBook()));
                  },
                  iconSize: 35,
                  splashColor: Colors.indigo,
                  tooltip: 'Criar',
                ),
                Text(
                  'Criar',
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
    );
  }
}
