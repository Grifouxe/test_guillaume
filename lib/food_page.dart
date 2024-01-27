import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottomnavigationbar.dart';
import 'navigation_bloc.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: FoodPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('food'),
      ),
      body: const Center(
        child: Text('Home Page Content'),
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationTab>(
        builder: (context, state) {
          return CustomBottomNavigationBar(
            selectedTab: state,
            onTabSelected: (tab) {
              context.read<NavigationBloc>().add(TabSelectedEvent(tab));

            },
          );
        },
      ),
    );
  }
}