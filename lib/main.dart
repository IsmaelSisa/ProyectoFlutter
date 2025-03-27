import 'package:flutter/material.dart';

import './screens/HomePage.dart';
import './screens/NosotrosPage.dart';
import './widgets/CustomBottomNavBar.dart';
import './screens/Acceso.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Technaid App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Acceso(), // Pantalla de login al inicio
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    NosotrosPage(),
    Placeholder(), // Servicios
    Placeholder(), // Otros
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
