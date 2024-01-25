import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

// Enumérations pour représenter chaque onglet
enum NavigationTab { training, food, home, ranking }
enum NavigationPage { training_page, food_page, home_page, ranking_page }

// Événements possibles pour le bloc de navigation
abstract class NavigationEvent {}

class TabSelectedEvent extends NavigationEvent {
  final NavigationTab selectedTab;

  TabSelectedEvent(this.selectedTab);
}

class NavigateToPageEvent extends NavigationEvent {
  final NavigationPage destinationPage;

  NavigateToPageEvent(this.destinationPage);
}

class NavigationBloc extends Bloc<NavigationEvent, NavigationTab> {
  NavigationBloc(BuildContext context, NavigationTab initialState) : super(initialState) {
    this.context = context;
  }

  @override
  Stream<NavigationTab> mapEventToState(NavigationEvent event) async* {
    if (event is TabSelectedEvent) {
      yield event.selectedTab;
    } else if (event is NavigateToPageEvent) {
      switch (event.destinationPage) {
        case NavigationPage.training_page:
          Navigator.pushNamed(context, '/training_page');
          break;
        case NavigationPage.food_page:
          Navigator.pushNamed(context, '/food_page');
          break;
        case NavigationPage.home_page:
          Navigator.pushNamed(context, '/home_page');
          break;
        case NavigationPage.ranking_page:
          Navigator.pushNamed(context, '/ranking_page');
          break;
      // Ajoutez d'autres cas selon vos besoins
      }
    }
  }

  late BuildContext context;
}

