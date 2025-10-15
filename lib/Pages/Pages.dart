import 'package:dog_care/Extensions/EmptyPetInfo.dart';
import 'package:flutter/material.dart';

/*
SafeArea(
        child:Center(
          child: Text("Pets Page"),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.pets),
      ),
*/

class PetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      body: Center(
            child: EmptyPetInfoCard(),
      ),  
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF20DF6C),
          fixedSize: Size(MediaQuery.of(context).size.width * 0.92, MediaQuery.of(context).size.height * 0.06),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: MediaQuery.of(context).size.width * 0.05,
              color: const Color.fromARGB(255, 240, 239, 239),
              fontWeight: FontWeight.bold,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.015),
            Text(
              'Add New Pet',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: const Color.fromARGB(255, 240, 239, 239),
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      onPressed: () {},
      )
    );  
  }
}

class DatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_rounded,
              size: MediaQuery.of(context).size.height * 0.2,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Text(
              'Your Sweeties Dates',
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Text("You can save your sweeties dates, here.")
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.event_rounded),
      ),
    );
  }
}

class AlbumsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_album,
              size: MediaQuery.of(context).size.height * 0.2,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Text(
              'Your Sweeties Albums',
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Text("You can save your sweeties photos, here.")
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_photo_alternate),
      ),
    );
  }
}