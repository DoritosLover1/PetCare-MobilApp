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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      body: SafeArea(
        child: Center(
          child: 
            IndexedStack(
                index: _selectedIndex,
                sizing: StackFit.expand,
                children: [
                  PetsPage(screenHeight: screenHeight, screenWidth: screenWidth,),
                  VaccinationsPage(screenHeight: screenHeight, screenWidth: screenWidth,),
                  AlbumsPage(screenHeight: screenHeight, screenWidth: screenWidth,),
                  AppointmentsPage(screenHeight: screenHeight, screenWidth: screenWidth,),
                ],
              )
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF20DF6C),
        unselectedItemColor: const Color(0xFF64748B),
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: "Pets",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.vaccines_rounded),
            label: "Vaccinations",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album_rounded),
            label: "Albums",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: "Appointments",
          ),
        ],
        onTap:(value) {
          setState(() {
            _selectedIndex = value;
          });
        }, 
      ) ,
    );
  }
}
