import 'package:flutter/material.dart';

class NavRail extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const NavRail({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final double fontSizeInRail = MediaQuery.of(context).size.width * 0.035;
    
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      labelType: NavigationRailLabelType.all,
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.pets),
          label: Text(
            'Pets',
            style: TextStyle(
              fontSize: fontSizeInRail,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        NavigationRailDestination(
          icon: Badge(
            isLabelVisible: false,
            child: Icon(Icons.calendar_month),
          ),
          label: Text(
            'Dates',
            style: TextStyle(
              fontSize: fontSizeInRail,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.photo_library),
          label: Text(
            'Albums',
            style: TextStyle(
              fontSize: fontSizeInRail,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}