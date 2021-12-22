// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:medlegten/repositories/login_repository.dart';
import 'package:medlegten/repositories/repository.dart';

enum AuthState { UnAuthorized, Authorizing, Authorized, AuthorizedAge, Initial }

final authProvider = StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel();
});

class AuthViewModel extends StateNotifier<AuthState> {
  late FirebaseAuth _auth;
  bool isGoogle = false;

  AuthViewModel() : super(AuthState.Initial);

  AuthState get authState => state;

  login() async {
    var token = await GetStorage().read('token') ?? '';

    if (token == '') {
      await Firebase.initializeApp();
      _auth = FirebaseAuth.instance;
      _auth.authStateChanges().listen((user) async {
        if (user == null) {
          changeStatus(AuthState.UnAuthorized);
        } else {
          await LoginRepository().fetchLoginInfo(user, '');
          _login();
        }
      });
      await loginFacebook();
    } else {
      dioRepository.setToken(token: token);
      _login();
    }
  }

  _login() async {
    var user = await LoginRepository().getUserInfo();
    if (user == null) {
      changeStatus(AuthState.UnAuthorized);
    } else {
      if (user.skipBirthDate == '0') {
        changeStatus(AuthState.AuthorizedAge);
      } else {
        changeStatus(AuthState.Authorized);
      }
    }
  }

  //_logOut() async {
  //  await _auth.signOut();
  //}

  changeStatus(AuthState status) async {
    state = status;
  }

  loginGoogle() async {
    isGoogle = true;
    changeStatus(AuthState.Authorizing);
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      _auth.signInWithCredential(credential);

      _login();
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      changeStatus(AuthState.UnAuthorized);
    }
  }

  loginFacebook() async {
    isGoogle = false;
    changeStatus(AuthState.Authorizing);
    try {
      LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        AuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        await _auth.signInWithCredential(credential);

        _login();
      } else {
        dioRepository.snackBar(result.message!);
        changeStatus(AuthState.UnAuthorized);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      changeStatus(AuthState.UnAuthorized);
    }
  }
}
