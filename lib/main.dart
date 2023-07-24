import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'splash_screen.dart'; // Upewnij się, że zaimportowałeś SplashScreen

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
    Center(child: Text('Strona 1')),
    Center(child: Text('Strona 2')),
    Center(child: Text('Strona 3')),
    Center(child: Text('Strona 4')),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Weed Consumption'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(


      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white ,         //  KOLOR: ZAZNACZENEJ IKONKI
        unselectedItemColor: Colors.black,          //  KOLOR: NIEZAZNACZONEGO
        backgroundColor: Colors.green[700],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ' Home ',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cannabis), // Użyj ikony marihuany z FontAwesome
            label: 'Strains',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: 'Stats',
          ),BottomNavigationBarItem(
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
