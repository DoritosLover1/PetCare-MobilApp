import 'dart:math';

import 'package:dog_care/Extensions/NavRail.dart';
import 'package:dog_care/Pages/Pages.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const DogCareApp());
}

class DogCareApp extends StatelessWidget {
  const DogCareApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(216, 216, 158, 51)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Pet Care",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.09,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      body: SafeArea(
        child: Row(
          children: [
            NavRail(
              selectedIndex: _selectedIndex, 
              onDestinationSelected: (i) {
                setState(() {
                  _selectedIndex = i;
                });
              },
            ),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                sizing: StackFit.expand,
                children: [
                  PetsPage(),
                  DatesPage(),
                  AlbumsPage(),
                ],
              ) 
            ),
          ],
        ),
      ),
    );
  }
}
