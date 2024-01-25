import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Événements
abstract class TrainingEvent {}

class GenerateButtonsEvent extends TrainingEvent {}

// État
abstract class TrainingState {}

class InitialTrainingState extends TrainingState {}

class GeneratedButtonsState extends TrainingState {}

// Ajoutez un nouvel événement
class ShowCardListEvent extends TrainingEvent {
  final CardListType cardListType;

  ShowCardListEvent(this.cardListType);
}


// Ajoutez un nouvel état avec un identifiant
class CardListVisibleState extends TrainingState {
  final CardListType cardListType;

  CardListVisibleState(this.cardListType);
}

enum CardListType {
  Push,
  Pull,
  Legs,
}

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  TrainingBloc() : super(InitialTrainingState());

  @override
  Stream<TrainingState> mapEventToState(TrainingEvent event) async* {
    if (event is GenerateButtonsEvent) {
      yield GeneratedButtonsState();
    } else if (event is ShowCardListEvent) {
      yield CardListVisibleState(event.cardListType);
    }
  }
}



class CardWidget extends ChangeNotifier {
  final String exerciseName;
  bool isChecked;

  CardWidget(this.exerciseName, this.isChecked);

  void toggleCheck() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
