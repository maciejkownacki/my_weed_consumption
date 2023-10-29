import 'package:flutter/material.dart';
import 'entry.dart'; // Upewnij się, że ten import jest poprawny w zależności od struktury Twojego projektu.

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Entry> entries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: entries.isEmpty
          ? Center(
        child: Text('Brak wpisów. Dodaj nowy wpis używając przycisku poniżej.'),
      )
          : ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(entries[index].date),
            subtitle: Text(entries[index].strain),
            // Możesz dodać więcej atrybutów wpisu w ten sposób
          );
        },
      ),
    );
  }

  // Metoda do dodawania wpisów
  void addEntry(Entry entry) {
    setState(() {
      entries.add(entry);
    });
  }
}
