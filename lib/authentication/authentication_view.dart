import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../food_page.dart';
import '../home_page.dart';
import '../login_page/sign_in/login_page.dart';
import '../ranking_page.dart';
import '../training_page.dart';
import 'authentication_bloc.dart';
import 'authentication_repository.dart';
import 'authentication_state.dart';
import 'package:flow_builder/flow_builder.dart';


class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}


List<Page<dynamic>> onGenerateAppViewPages(
    AppStatus state,
    List<Page<dynamic>> pages,
    ) {
  switch (state) {
    case AppStatus.authenticated:

      return [
        RankingPage.page(),
        HomePage.page(),
      FoodPage.page(), // Ajoutez la page FoodPage
  TrainingPage.page(), // Ajoutez la page TrainingPage
   // Ajoutez la page RankingPage
  ];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}