import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit() : super(PhoneAuthInitial());
  late String _verificationId;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> submitedPhoneNumber(String phoneNumber) async {
    emit(PhoneAuthLoading());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(minutes: 2),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    await _signIn(credential);
  }

  void verificationFailed(FirebaseAuthException e) {
    emit(PhoneAuthFaluire(errorMessage: e.toString()));
  }

  void codeSent(String verificationId, int? resendToken) async {
    _verificationId = verificationId;
    emit(PhoneAuthSuccess());
  }

  void codeAutoRetrievalTimeout(String verificationId) {}

  Future<void> submitedOTP(String otp) async {
    emit(PhoneAuthLoading());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otp,
    );
    await _signIn(credential);
  }

  Future<void> _signIn(PhoneAuthCredential c) async {
    try {
      await _auth.signInWithCredential(c);
      emit(PhoneOtpVerified());
    } on FirebaseAuthException catch (e) {
      emit(PhoneAuthFaluire(errorMessage: e.toString()));
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = _auth.currentUser!;
    return firebaseUser;
  }
}
