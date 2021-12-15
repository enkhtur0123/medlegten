// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:medlegten/models/app_user.dart';
import 'package:medlegten/providers/app_provider.dart';
import 'package:medlegten/repositories/repository.dart';

enum AuthState { Unauthorized, Authorizing, Authorized }

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
      //appProvider.navi?.pushNamedAndRemoveUntil('/Home', (route) => true);
    } else {
      final token = await getToken(fbuser);
      repo.setToken(token);
      //user = await repo.login(fbuser);
      //if (user == null) {
      //  logOut();
      //} else {
      //  changeStatus(AuthState.Undefined);
      //}
    }
  }

  logOut() async => await _auth.signOut();

  Future<String> getToken(User fbuser) async {
    try {
      return await fbuser.getIdToken(true);
    } catch (e) {
      return '';
    }
  }

  changeStatus(status) {
    appProvider.navi?.pushNamedAndRemoveUntil('/Home', (route) => true);
    _authState = status;
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
      Fluttertoast.showToast(
        msg: e.toString().toUpperCase(),
        gravity: ToastGravity.SNACKBAR,
      );
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
        Fluttertoast.showToast(
          msg: result.message!,
          gravity: ToastGravity.SNACKBAR,
        );
        changeStatus(AuthState.Unauthorized);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString().toUpperCase(),
        gravity: ToastGravity.SNACKBAR,
      );
      changeStatus(AuthState.Unauthorized);
    }
  }
}
