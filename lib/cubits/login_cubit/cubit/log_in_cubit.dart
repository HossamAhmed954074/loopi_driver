import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  FirebaseAuth auth = FirebaseAuth.instance;


   Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LogInLoading());
    try {
      final _ = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LogInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LogInFaluire('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LogInFaluire('Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(LogInFaluire(e.toString()));
    }
  }

   Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }
}
