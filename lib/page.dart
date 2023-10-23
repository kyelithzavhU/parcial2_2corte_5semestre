import 'package:flutter/material.dart';
import 'package:hola/Hola.dart';
import 'main.dart';

void main() {
  runApp(MyApp());
}

class page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 129, 109, 42),
        title: Row(
          children: [
            Text('Autores'),
            SizedBox(width: 10), // Espacio entre "Autores" y el botón
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HolaScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Cambia el color del botón a rojo
              ),
              child: Text('other screen'),
            ),

          ],
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/lñ.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ComicCard(
                title: 'Mario Mendoza',
                imageUrl: 'assets/MARIO.jpeg',
                description: 'Descripción del cómic 1',
              ),
              SizedBox(height: 20),
              ComicCard(
                title: 'Clive Staples Lewis',
                imageUrl: 'assets/clippo.jpg',
                description: 'Descripción del cómic 1',
              ),
              SizedBox(height: 20),
              ComicCard(
                title: 'JK Rowling',
                imageUrl: 'assets/ju.jpg',
                description: 'Descripción del cómic 1',
              ),
              SizedBox(height: 10),
              ComicCard(
                title: 'Edgar Allan Poe',
                imageUrl: 'edgara.png',
                description: 'Descripción del cómic 2',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ComicCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  ComicCard({required this.title, required this.imageUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Color.fromARGB(255, 139, 113, 69),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.asset(imageUrl, fit: BoxFit.cover, height: 120),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
