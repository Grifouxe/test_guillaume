import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottomnavigationbar.dart';
import 'navigation_bloc.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ranking'),
      ),
      body: const Center(
        child: Text('Home Page Content'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedTab: context.select((NavigationBloc bloc) => bloc.state),
        onTabSelected: (tab) {
          context.read<NavigationBloc>().add(TabSelectedEvent(tab));
          // Naviguez vers la nouvelle page ici
          switch (tab) {
            case NavigationTab.training:
              Navigator.pushNamed(context, '/training_page');
              break;
            case NavigationTab.food:
              Navigator.pushNamed(context, '/food_page');
              break;
            case NavigationTab.home:
              Navigator.pushNamed(context, '/home_page');
              break;
            case NavigationTab.ranking:
              Navigator.pushNamed(context, '/ranking_page');
              break;
          }
        },
      ),
    );
  }
}
