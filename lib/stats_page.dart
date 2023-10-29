import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'splash_screen.dart';
import 'stats_page.dart'; // Upewnij się, że zaimportowałeś SplashScreen
import 'strains_page.dart';
import 'entry.dart';


class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text('This is the Stats Page'),
      ),
    );
  }
}
