import "package:flutter/material.dart";
import "package:flutter/services.dart";

class PetCard extends StatelessWidget {

  final String petName;
  final String petBreed;
  final String petGender;
  final double petAge;
  final Uint8List petImage;

  const PetCard({
    super.key,
    required this.petName,
    required this.petBreed,
    required this.petAge,
    required this.petGender,
    required this.petImage
  });

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5.0,
      ),
      onPressed: () {
        // Handle button press
      },
      child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundImage: MemoryImage(petImage),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    petName,
                    style: const TextStyle(
                      color: Color.fromARGB(178, 0, 0, 0),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    petBreed,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 198, 219, 252),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          petGender,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF2563EB),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 189, 255, 215),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          petAge.toString() + " years",
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF20DF6C),
                          ),
                        ),
                      ),
                    ]
                  )
                ],
              ),
            ),
        ],
      ),
    ),
    );
  }
}