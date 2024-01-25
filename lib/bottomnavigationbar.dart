import 'package:flutter/material.dart';
import 'navigation_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final NavigationTab selectedTab;
  final Function(NavigationTab) onTabSelected;

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
        NavigationTab selectedTab;
        switch (index) {
          case 0:
            selectedTab = NavigationTab.training;
            break;
          case 1:
            selectedTab = NavigationTab.food;
            break;
          case 2:
            selectedTab = NavigationTab.home;
            break;
          case 3:
            selectedTab = NavigationTab.ranking;
            break;
          default:
            selectedTab = NavigationTab.home;
        }
        onTabSelected(selectedTab);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Training',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apple),
          label: 'Food',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grade_sharp),
          label: 'Ranking',
        ),
      ],
    );
  }
}
