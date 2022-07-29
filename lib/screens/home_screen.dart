import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// clase private
class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  // final userLabel = 'User;'
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My primer Flutter $currentPage'),
          centerTitle: true,
          elevation: 10,
        ),

        // *BODY
        // *Page View
        body: PageView(
          children: [
            CustomScreen(
                colorUno: Colors.amberAccent, texto: WordPair.random()),
            CustomScreen(
                colorUno: Colors.greenAccent, texto: WordPair.random()),
            CustomScreen(colorUno: Colors.indigo, texto: WordPair.random()),
          ],
        ),
        // ),

        // *TABS
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (index) {
            currentPage = index;
            // se tiene   ue se redibuje la pantalla
            setState(() {});
          },
          elevation: 10,
          selectedItemColor: Colors.greenAccent,
          backgroundColor: Colors.pink,
          unselectedItemColor: Colors.deepOrangeAccent.withOpacity(0.8),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'Timer $currentPage',
              backgroundColor: Colors.pink,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.verified_user_outlined), label: 'User'),
          ],
        ));
  }
}

// componente

class CustomScreen extends StatelessWidget {
  final Color colorUno;
  final WordPair texto;

  const CustomScreen({super.key, required this.colorUno, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorUno,
      child: Center(
        // child: Text(texto.asCamelCase),
        child: RandomWords(),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return ListTile(
          title: Text(_suggestions[index].asCamelCase),
          textColor: Colors.white,
          trailing: Icon(
            Icons.favorite_border,
            color: Colors.redAccent,
          ),
          // trailing: Icon(color: Colors.red),
        );
      },
    );
  }
}
