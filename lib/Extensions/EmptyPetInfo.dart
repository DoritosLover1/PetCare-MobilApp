
import 'package:flutter/material.dart';

class EmptyPetInfoCard extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(115, 104, 104, 104),
                spreadRadius: 2,
                blurRadius: 10,
              )
            ]
          ),
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 200, 238, 215),
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.article_rounded,
                size: MediaQuery.of(context).size.width * 0.1,
                color: const Color(0xFF20DF6C),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            Text(
              "Your Pet Profiles Live Here", 
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.025, 
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              "Hey there! This is where you can keep all your buddy's information. Click the '+' button to add your first pet!", 
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.015, 
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 122, 122, 122)
              ),
              textAlign: TextAlign.center,
            ),
          ],
     ),
    );
  }
}