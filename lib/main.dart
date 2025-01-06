import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(DeckOfCardsApp());
}

class DeckOfCardsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deck of Cards API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DeckScreen(),
    );
  }
}

class DeckScreen extends StatefulWidget {
  @override
  _DeckScreenState createState() => _DeckScreenState();
}

class _DeckScreenState extends State<DeckScreen> {
  String? deckId;
  List<String> drawnCards = [];
  bool isLoading = false;

  Future<void> shuffleDeck() async {
    setState(() => isLoading = true);
    final response = await http
        .get(Uri.parse('https://deckofcardsapi.com/api/deck/new/shuffle/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        deckId = data['deck_id'];
        drawnCards.clear();
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
      throw Exception('Failed to shuffle the deck');
    }
  }

  Future<void> drawCards(int count) async {
    if (deckId == null) return;
    setState(() => isLoading = true);
    final response = await http.get(Uri.parse(
        'https://deckofcardsapi.com/api/deck/$deckId/draw/?count=$count'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        drawnCards = data['cards']
            .map<String>((card) => card['image'] as String)
            .toList();
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
      throw Exception('Failed to draw cards');
    }
  }

  @override
  void initState() {
    super.initState();
    shuffleDeck(); // Shuffle the deck when the app starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deck of Cards API'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                ElevatedButton(
                  onPressed: shuffleDeck,
                  child: Text('Shuffle Deck'),
                ),
                ElevatedButton(
                  onPressed: () => drawCards(5),
                  child: Text('Draw 5 Cards'),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: drawnCards.length,
                    itemBuilder: (context, index) {
                      return Image.network(drawnCards[index]);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
