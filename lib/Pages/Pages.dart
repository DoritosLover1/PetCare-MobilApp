import 'dart:typed_data';

import 'package:dog_care/DB/DBConnection.dart';
import 'package:dog_care/Extensions/EmptyPetInfo.dart';
import 'package:dog_care/Extensions/PetCard.dart';
import 'package:dog_care/Extensions/SpecializedElevatedButton.dart';
import 'package:flutter/material.dart';


class PetsPage extends StatefulWidget {
  double screenHeight;
  double screenWidth;

  PetsPage({super.key, required this.screenHeight, required this.screenWidth});  

  @override
  _PetsPageState createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      body: FutureBuilder(
        future: DBConnection().getAnimals(),
        builder: (context, snapshot) {
          final animals = snapshot.data ?? <Map<String, dynamic>>[];
          return Center(
            child: (animals.isEmpty) ? EmptyInfoCard(
                screenHeight: widget.screenHeight,
                screenWidth: widget.screenWidth,
                sectionText: "Your buddy's profiles live here",
                subText:
                  "Hey there! This is where you can keep all your buddy's information. Tap the '+' button to add your buddy!",
                icon: Icons.article_rounded,
              )
              :
              ListView.builder(
              itemCount: animals.length,
              itemBuilder: (context, index) {
                final pet = animals[index];
                return PetCard(
                  petId: pet['id'] as int,
                  petName: pet['name'] as String,
                  petBreed: pet['breed'] as String,
                  petAge: (pet['age'] as num).toDouble(),
                  petGender: pet['gender'] as String,
                  petImage: pet['image'] as Uint8List,
                );
              },
            )
          );
        },
      ),
      floatingActionButton: SpecializedElevatedButton(
        screenHeight: widget.screenHeight,
        screenWidth: widget.screenWidth,
        sectionText: 'Add New Pet',
      ),
    );
  }
}


class VaccinationsPage extends StatefulWidget {
  double screenHeight;
  double screenWidth;

  VaccinationsPage({super.key, required this.screenHeight, required this.screenWidth});  

  @override
  _VaccinationsPageState createState() => _VaccinationsPageState();
}

class _VaccinationsPageState extends State<VaccinationsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      body: Center(
            child: EmptyInfoCard(
              screenHeight: widget.screenHeight, 
              screenWidth: widget.screenWidth, 
              sectionText: "Keep track of your buddy's vaccinations here!", 
              subText:"No records yet. Tap the '+' to add your buddy's vaccination",
              icon: Icons.vaccines_rounded,
            ),
      ),  
      floatingActionButton: SpecializedElevatedButton(
        screenHeight: widget.screenHeight, 
        screenWidth: widget.screenWidth, 
        sectionText: 'Add New Vaccination',
      ),
    );  
  }
}


class AlbumsPage extends StatefulWidget {
  double screenHeight;
  double screenWidth;

  AlbumsPage({super.key, required this.screenHeight, required this.screenWidth});  

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      body: Center(
            child: EmptyInfoCard(
              screenHeight: widget.screenHeight, 
              screenWidth: widget.screenWidth, 
              sectionText: "Your buddy's albums live here",
              subText:"Hey there! This is where you can keep all your buddy's albums or album. Tap the '+' button to add your buddy's album!",
              icon: Icons.event_rounded,
            ),
      ),  
      floatingActionButton: SpecializedElevatedButton(
        screenHeight: widget.screenHeight, 
        screenWidth: widget.screenWidth, 
        sectionText: 'Add New Album',
      ),
    );  
  }
}


class AppointmentsPage extends StatefulWidget {
  double screenHeight;
  double screenWidth;

  AppointmentsPage({super.key, required this.screenHeight, required this.screenWidth});  

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();  
}

class _AppointmentsPageState extends State<AppointmentsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      body: Center(
            child: EmptyInfoCard(
              screenHeight: widget.screenHeight, 
              screenWidth: widget.screenWidth, 
              sectionText: "Keep track of your buddy's appointments here!", 
              subText:"Hey there! This is where you can keep all your buddy's appointment information.",
              icon: Icons.event_rounded,
            ),
      ),  
      floatingActionButton: SpecializedElevatedButton(
        screenHeight: widget.screenHeight, 
        screenWidth: widget.screenWidth, 
        sectionText: 'Add New Appointment',
      ),
    );  
  }
}


class AddAnimalPage extends StatefulWidget {
  double screenHeight;
  double screenWidth;

  AddAnimalPage({super.key, required this.screenHeight, required this.screenWidth});

  @override
  _AddAnimalPageState createState() => _AddAnimalPageState();
}

class _AddAnimalPageState extends State<AddAnimalPage> {
  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: // Buraya özel appbar yapılacak her yere customize edilebilen,
    )
  }
}