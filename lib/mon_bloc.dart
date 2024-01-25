import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Événements possibles
abstract class AuthEvent {}

class SignInWithGoogleEvent extends AuthEvent {}
class SignOutWithGoogleEvent extends AuthEvent {}

// État de l'authentification
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthenticatedState extends AuthState {}

class UnauthenticatedState extends AuthState {}



class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthBloc() : super(AuthInitialState());


  AuthState get initialState => AuthInitialState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignInWithGoogleEvent) {
      try {
        final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
        final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication?.accessToken,
          idToken: googleSignInAuthentication?.idToken,
        );

        await _firebaseAuth.signInWithCredential(credential);

        if (_firebaseAuth.currentUser != null) {
          yield AuthenticatedState();
        } else {
          yield UnauthenticatedState();
        }
      } catch (e) {
        print("Error during Google Sign In: $e");
        yield UnauthenticatedState();
      }
    }
    else if (event is SignOutWithGoogleEvent) {
      try {
        await _googleSignIn.signOut();
        await _firebaseAuth.signOut();
        yield AuthInitialState();
      } catch (e) {
        print("Error during Sign Out: $e");
      }
    }
  }
}
