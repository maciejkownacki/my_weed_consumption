import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'splash_screen.dart';
import 'stats_page.dart'; // Upewnij się, że zaimportowałeś SplashScreen
import 'strains_page.dart';
import 'entry.dart';


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text('Język'),
              subtitle: Text('Polski'), // Przykładowa wartość, powinna być dynamiczna
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Dodaj logikę zmiany języka tutaj
              },
            ),
            ListTile(
              title: Text('Motyw'),
              subtitle: Text('Ciemny'), // Przykładowa wartość, powinna być dynamiczna
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Dodaj logikę zmiany motywu tutaj
              },
            ),
          ],
        ).toList(),
      ),
    );
  }
}
