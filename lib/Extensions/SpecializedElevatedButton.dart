import 'package:flutter/material.dart';

class SpecializedElevatedButton extends StatelessWidget {

  final double screenHeight;
  final double screenWidth;
  final String sectionText;

  const SpecializedElevatedButton({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.sectionText
  });

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
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
              sectionText,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                color: const Color.fromARGB(255, 240, 239, 239),
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      onPressed: () {},
    );     
  }
}