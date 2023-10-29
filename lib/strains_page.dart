import 'package:flutter/material.dart';

class StrainsPage extends StatefulWidget {
  @override
  _StrainsPageState createState() => _StrainsPageState();
}

class _StrainsPageState extends State<StrainsPage> {
  List<Entry> entries = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(entries[index].name),
            subtitle: Text('ILOŚĆ: ${entries[index].amount} CENA: ${entries[index].price}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEntryDialog(context),
        child: Icon(Icons.add),
        tooltip: 'Dodaj nowy wpis',
      ),
    );
  }

  void _showAddEntryDialog(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Dodaj nowy wpis'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'NAZWA'),
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'ILOŚĆ'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'CENA'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ANULUJ'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  entries.add(Entry(
                    name: nameController.text,
                    amount: amountController.text,
                    price: priceController.text,
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text('ZAPISZ'),
            ),
          ],
        );
      },
    );
  }
}

class Entry {
  final String name;
  final String amount;
  final String price;

  Entry({required this.name, required this.amount, required this.price});
}
