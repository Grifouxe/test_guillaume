import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication/authentication_bloc.dart';
import 'authentication/authentication_observer.dart';
import 'authentication/authentication_repository.dart';
import 'authentication/authentication_state.dart';
import 'authentication/authentication_view.dart';
import 'firebase_options.dart';
import 'home_page.dart';
import 'login_page/sign_in/login_page.dart';

import 'package:flutter/material.dart';
import 'package:bloc_application/form.dart'; // Importez votre fichier de questionnaire


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(App(authenticationRepository: authenticationRepository));
}



class App extends StatelessWidget {

  const App({
    required AuthenticationRepository authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    /*return const MaterialApp(
      title: 'Votre Application',
      home: Questionnaire(), // Affichez le questionnaire comme page d'accueil
    );*/

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
      debugShowCheckedModeBanner : false,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}





