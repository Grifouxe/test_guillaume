import 'package:bloc_application/home_page.dart';
import 'package:bloc_application/ranking_page.dart';
import 'package:bloc_application/tools/firebase_options.dart';
import 'package:bloc_application/training_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'authentication/authentication_bloc.dart';
import 'authentication/authentication_observer.dart';
import 'authentication/authentication_repository.dart';
import 'authentication/authentication_state.dart';
import 'authentication/authentication_view.dart';
import 'food_page.dart';
import 'navigation_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthenticationRepository>.value(value: authenticationRepository),
        BlocProvider(
          create: (_) => AppBloc(authenticationRepository: authenticationRepository),
        ),
        BlocProvider(
          create: (_) => NavigationBloc(),
        ),
      ],
      child: MyApp(authenticationRepository: authenticationRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    required AuthenticationRepository authenticationRepository,
    Key? key,
  }) : _authenticationRepository = authenticationRepository, super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        // Vérifiez le nom de la route et renvoyez la route appropriée
        if (settings.name == '/training_page') {
          return MaterialPageRoute(builder: (context) => TrainingPage());
        } else if (settings.name == '/food_page') {
          return MaterialPageRoute(builder: (context) => FoodPage());
        } else if (settings.name == '/ranking_page') {
          return MaterialPageRoute(builder: (context) => RankingPage());
        } else if (settings.name == '/home_page') {
          return MaterialPageRoute(builder: (context) => HomePage());
        }

        // Si aucune condition n'est satisfaite, renvoyez null
        return null;
      },
      debugShowCheckedModeBanner: false,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}










