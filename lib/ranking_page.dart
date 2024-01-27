import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottomnavigationbar.dart';
import 'navigation_bloc.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: RankingPage());

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
    },
    ),

    );
  }
}
