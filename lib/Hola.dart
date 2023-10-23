import 'package:flutter/material.dart';
import 'package:hola/page.dart';

class HolaScreen extends StatelessWidget {
  final List<Comic> comics = [
    Comic('Cronicas de Narnia', 'assets/narnia.webp', 'Películas', [
      'The Lion, the Witch and the Wardrobe',
      'Prince Caspian',
      'The Voyage of the Dawn Treader',
      'The Silver Chair',
      'The Horse and His Boy',
    ]),
    Comic('Game of thrones', 'assets/got.webp', 'Juego de tronos, saga', []),
    Comic('Harry Potter', 'assets/clo.jpg', 'wizarding world saga', []),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 54, 46, 76),
        title: Row(
          children: [
            Text('Sagas populares'),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => page(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text('Autores'),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/melob.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: comics.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ComicDetailScreen(comic: comics[index]),
                  ),
                );
              },
              child: ComicCard(comic: comics[index]),
            );
          },
        ),
      ),
    );
  }
}

class Comic {
  final String title;
  final String imageUrl;
  final String description;
  final List<String> peliculas;

  Comic(this.title, this.imageUrl, this.description, this.peliculas);
}

class ComicCard extends StatelessWidget {
  final Comic comic;

  ComicCard({required this.comic});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/ss.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              comic.imageUrl,
              fit: BoxFit.cover,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                comic.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ComicDetailScreen extends StatelessWidget {
  final Comic comic;

  ComicDetailScreen({required this.comic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comic.title),
      ),
      body: Column(
        children: [
          Image.asset(
            comic.imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.orange, // Color de fondo naranja
              padding: EdgeInsets.all(16.0),
              child: Text(
                comic.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          if (comic.peliculas != null && comic.peliculas.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Películas de ${comic.title}:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      itemCount: comic.peliculas.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            comic.peliculas[index],
                            style: TextStyle(fontSize: 16),
                          ),
                          leading: Icon(Icons.movie),
                        );
                      },
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
