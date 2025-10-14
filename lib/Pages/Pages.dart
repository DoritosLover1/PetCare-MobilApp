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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pets,
              size: MediaQuery.of(context).size.height * 0.2,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Text(
              'Your Sweeties',
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Text("You can save your sweeties informations, here.")
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.pets),
      ),
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