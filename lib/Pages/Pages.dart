import 'package:dog_care/Extensions/EmptyPetInfo.dart';
import 'package:dog_care/Extensions/SpecializedElevatedButton.dart';
import 'package:flutter/material.dart';


abstract class _AbstractPage extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const _AbstractPage({super.key , required this.screenHeight, required this.screenWidth});
}

class PetsPage extends _AbstractPage {

  const PetsPage({
    super.key,
    required super.screenHeight,
    required super.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      body: Center(
            child: EmptyInfoCard(
              screenHeight: screenHeight, 
              screenWidth: screenWidth, 
              sectionText: "Your buddy's profiles live here", 
              subText:"Hey there! This is where you can keep all your buddy's information. Tap the '+' button to add your buddy!",
              icon: Icons.article_rounded,
            ),
      ),  
      floatingActionButton: SpecializedElevatedButton(
        screenHeight: screenHeight, 
        screenWidth: screenWidth, 
        sectionText: 'Add New Pet',
      ),
    );  
  }
}

class VaccinationsPage extends _AbstractPage {

  const VaccinationsPage({
    super.key,
    required super.screenHeight,
    required super.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      body: Center(
            child: EmptyInfoCard(
              screenHeight: screenHeight, 
              screenWidth: screenWidth, 
              sectionText: "Keep track of your buddy's vaccinations here!", 
              subText:"No records yet. Tap the '+' to add your buddy's vaccination",
              icon: Icons.vaccines_rounded,
            ),
      ),  
      floatingActionButton: SpecializedElevatedButton(
        screenHeight: screenHeight, 
        screenWidth: screenWidth, 
        sectionText: 'Add New Vaccination',
      ),
    );  
  }
}

class AlbumsPage extends _AbstractPage {

  const AlbumsPage({
    super.key,
    required super.screenHeight,
    required super.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      body: Center(
            child: EmptyInfoCard(
              screenHeight: screenHeight, 
              screenWidth: screenWidth, 
              sectionText: "Your buddy's albums live here",
              subText:"Hey there! This is where you can keep all your buddy's albums or album. Tap the '+' button to add your buddy's album!",
              icon: Icons.event_rounded,
            ),
      ),  
      floatingActionButton: SpecializedElevatedButton(
        screenHeight: screenHeight, 
        screenWidth: screenWidth, 
        sectionText: 'Add New Album',
      ),
    );  
  }
}

class AppointmentsPage extends _AbstractPage {

  const AppointmentsPage({
    super.key,
    required super.screenHeight,
    required super.screenWidth,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      body: Center(
            child: EmptyInfoCard(
              screenHeight: screenHeight, 
              screenWidth: screenWidth, 
              sectionText: "Keep track of your buddy's appointments here!", 
              subText:"Hey there! This is where you can keep all your buddy's appointment information.",
              icon: Icons.event_rounded,
            ),
      ),  
      floatingActionButton: SpecializedElevatedButton(
        screenHeight: screenHeight, 
        screenWidth: screenWidth, 
        sectionText: 'Add New Appointment',
      ),
    );  
  }
}