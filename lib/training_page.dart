import 'package:bloc_application/training_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'bottomnavigationbar.dart';
import 'navigation_bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class CardWidget {
  final String exerciseName;
  bool isChecked;

  CardWidget(this.exerciseName, this.isChecked);
}

class TrainingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrainingBloc(),
      child: TrainingPageContent(),
    );
  }
}

class TrainingPageContent extends StatelessWidget {
  List<CardWidget> _cardWidgets = [];

  List<Widget> _buildCardList(CardListType cardListType, BuildContext context) {
    _cardWidgets = Provider.of<List<CardWidget>>(context);

    switch (cardListType) {
      case CardListType.Push:
        return [
          const Card(
            child: ListTile(
              leading: CircleAvatar(),
              title: Text('Dips : '),
              subtitle: Text('4 ' + 'séries de ' + '12 ' + 'répétitions'),
            ),
          ),
          const Card(
            child: ListTile(
              leading: CircleAvatar(),
              title: Text('Développé couché : '),
              subtitle: Text('4 ' + 'séries de ' + '12 ' + 'répétitions'),
            ),
          ),
        ];
      case CardListType.Pull:
        return [
          const Card(
            child: ListTile(
              leading: CircleAvatar(),
              title: Text('élevation latérale : '),
              subtitle: Text('4 ' + 'séries de ' + '12 ' + 'répétitions'),
            ),
          ),
        ];
      case CardListType.Legs:
        return [
          const Card(
            child: ListTile(
              leading: CircleAvatar(),
              title: Text('Dips : '),
              subtitle: Text('4 ' + 'séries de ' + '12 ' + 'répétitions'),
            ),
          ),
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('training'),
      ),
      body: BlocBuilder<TrainingBloc, TrainingState>(
        builder: (context, state) {
          if (state is InitialTrainingState) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<TrainingBloc>().add(GenerateButtonsEvent());
                },
                child: Text('Lance une séance :)'),
              ),
            );
          } else if (state is GeneratedButtonsState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                    context.read<TrainingBloc>().add(ShowCardListEvent(
                        CardListType.Push));
                  }, child: Text('Push')),
                  ElevatedButton(onPressed: () {
                    context.read<TrainingBloc>().add(ShowCardListEvent(
                        CardListType.Pull));
                  }, child: Text('Pull')),
                  ElevatedButton(onPressed: () {
                    context.read<TrainingBloc>().add(ShowCardListEvent(
                        CardListType.Legs));
                  }, child: Text('Legs')),
                ],
              ),
            );
          } else if (state is CardListVisibleState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _handleValidation(state.cardListType);
                  },
                  child: Text('Valider'),
                ),
              ],
            );
          }

          return Container(); // Peut être un état par défaut ou vide
        },
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

  void _handleValidation(CardListType cardListType) {
    // Récupérer les informations des exercices cochés
    List<String> selectedExercises = [];
    for (CardWidget cardWidget in _cardWidgets) {
      if (cardWidget.isChecked) {
        selectedExercises.add(cardWidget.exerciseName);
      }
    }

    // Stocker les informations sur Realtime Database
    _storeExercisesOnRealtimeDatabase(cardListType, selectedExercises);
    // Ajouter ici la logique pour afficher un message de succès ou effectuer d'autres actions nécessaires
  }

  void _storeExercisesOnRealtimeDatabase(CardListType cardListType,
      List<String> selectedExercises) {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    databaseReference.child('exercises').child(cardListType.toString()).set(
        selectedExercises);
  }
}
