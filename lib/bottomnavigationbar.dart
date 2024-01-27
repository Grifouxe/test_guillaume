import 'package:flutter/material.dart';
import 'navigation_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final NavigationTab selectedTab;
  final ValueChanged<NavigationTab> onTabSelected;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedTab,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedTab.index,
      onTap: (index) {
        NavigationTab selectedTab = NavigationTab.values[index];
        onTabSelected(selectedTab);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Training',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood),
          label: 'Food',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Ranking',
        ),
      ],
    );
  }
}



