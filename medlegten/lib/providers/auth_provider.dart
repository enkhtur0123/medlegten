// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:medlegten/models/app_user.dart';
import 'package:medlegten/repositories/login_repository.dart';
import 'package:medlegten/repositories/repository.dart';

enum AuthState { Unauthorized, Authorizing, Authorized, AuthorizedAge }

final authProvider = StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel();
});

class AuthViewModel extends StateNotifier<AuthState> {
  AuthState _authState;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isGoogle = false;

  AuthViewModel([this._authState = AuthState.Unauthorized])
      : super(_authState) {
    _auth.authStateChanges().listen((user) {
      authStateListener(user);
    });
  }

  AppUser? user;
  AuthState get authState => _authState;
  FirebaseAuth get auth => _auth;

  authStateListener(User? fbuser) async {
    if (fbuser == null) {
      changeStatus(AuthState.Unauthorized);
    } else {
      final token = await fbuser.getIdToken(true);

      //repo.setToken(token);

      await LoginRepository().fetchLoginInfo(fbuser);

      //user =
      //if (user == null) {
      //  logOut();
      //} else {
      //  changeStatus(AuthState.Undefined);
      //}
    }
  }

  logOut() async => await _auth.signOut();

  changeStatus(AuthState status) async {
    if (status == AuthState.Authorized) {
      var userInfo = await LoginRepository().getUserInfo();

      if (userInfo?.age == -2) {
        _authState = AuthState.AuthorizedAge;
      } else {
        _authState = status;
      }
    } else {
      _authState = status;
    }

    state = _authState;
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
      changeStatus(AuthState.Authorized);
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      changeStatus(AuthState.Unauthorized);
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
        await auth.signInWithCredential(credential);

        changeStatus(AuthState.Authorized);
      } else {
        dioRepository.snackBar(result.message!);
        changeStatus(AuthState.Unauthorized);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      changeStatus(AuthState.Unauthorized);
    }
  }
}
