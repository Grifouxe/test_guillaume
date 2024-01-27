import 'package:bloc/bloc.dart';


// Enumérations pour représenter chaque onglet
enum NavigationTab { training, food, home, ranking }
enum NavigationPage { training_page, food_page, home_page, ranking_page }

// Événements possibles pour le bloc de navigation
abstract class NavigationEvent {}

class TabSelectedEvent extends NavigationEvent {
  final NavigationTab selectedTab;

  TabSelectedEvent(this.selectedTab);
}

class NavigationBloc extends Bloc<NavigationEvent, NavigationTab> {
  NavigationBloc() : super(NavigationTab.home) {
  on<TabSelectedEvent>((event, emit) {
  // Traitement de l'événement ici
  emit(event.selectedTab);
  }
  );}
  Stream<NavigationTab> mapEventToState(NavigationEvent event) async* {
    if (event is TabSelectedEvent) {
    yield event.selectedTab;
    }
    }
}






