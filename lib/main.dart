import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'splash_screen.dart';
import 'stats_page.dart'; // Upewnij się, że zaimportowałeś SplashScreen
import 'strains_page.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moja Aplikacja',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(), // Zmieniamy MyHomePage na SplashScreen
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final tabs = [
    HomePage(),
    StrainsPage(),
    StatsPage(),
    SettingsPage(), // To jest Twoja nowa strona ustawień
  ];

  void _showAddEntryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dodaj nowy wpis'),
          content: SingleChildScrollView( // Dodano SingleChildScrollView dla przewijania
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ustawienie rozmiaru na minimum
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Data',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Odmiana',
                  ),
                ),
                // ... Dodaj tu pozostałe pola formularza
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Dodaj'),
              onPressed: () {
                // Tutaj będziemy zapisywać dane
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Anuluj'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Weed Consumption'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Tło (Twoje strony)
          tabs[_currentIndex],
          // FloatingActionButton na dole i w poziomie
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: FloatingActionButton(
                onPressed: _showAddEntryDialog,
                child: Icon(Icons.add),
                tooltip: 'Dodaj nowy wpis',
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.green[700],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ' Home ',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cannabis),
            label: 'Strains',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings ',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}