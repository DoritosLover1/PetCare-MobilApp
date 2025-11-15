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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAnimalPage(screenHeight: widget.screenHeight, screenWidth: widget.screenWidth)),
          );
        }
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 239, 239),
        title: const Center(
          widthFactor: 2.1,
          child: Text(
            "Add Pet Profile",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                width: widget.screenWidth * 0.25,
                height: widget.screenWidth * 0.25,
                decoration: const BoxDecoration(
                  color: Color(0xFF20DF6C),
                  shape: BoxShape.circle
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.add_a_photo_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
              
              const SizedBox(height: 30),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pet's Name",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "Enter name",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF20DF6C)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Breed",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _breedController,
                    decoration: InputDecoration(
                      hintText: "e.g., Golden Retriever",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF20DF6C)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Age (Years)",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "e.g., 5",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[400],
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF20DF6C)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Weight (lbs)",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "e.g., 65",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[400],
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF20DF6C)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 100),

              SpecializedElevatedButton(
                screenHeight: widget.screenHeight, 
                screenWidth: widget.screenWidth, 
                sectionText: 'Add Pet',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}