import 'package:flutter/material.dart';

class EmptyInfoCard extends StatelessWidget{

  final double screenWidth;
  final double screenHeight;
  final String sectionText;
  final String subText;
  final IconData icon;

  const EmptyInfoCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.sectionText,
    required this.subText,
    required this.icon
  });

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
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
      padding: EdgeInsets.all(screenWidth * 0.03),
      width: screenWidth * 0.6,
      height: screenHeight * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: screenWidth * 0.2,
            height: screenWidth * 0.2,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 200, 238, 215),
              shape: BoxShape.circle
            ),
            child: Icon(
              icon,
              size: screenWidth * 0.1,
              color: const Color(0xFF20DF6C),
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          Text(
            sectionText, 
            style: TextStyle(
              fontSize: screenHeight * 0.025, 
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.visible,
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            subText, 
            style: TextStyle(
              fontSize: screenHeight * 0.015, 
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 122, 122, 122)
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}