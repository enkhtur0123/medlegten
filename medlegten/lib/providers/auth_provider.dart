// ignore_for_file: constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
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
  final FirebaseAuth _auth;
  bool? isGoogle;
  User? fUser;

  AuthViewModel()
      : _auth = FirebaseAuth.instance,
        super(AuthState.Initial) {
    _auth.authStateChanges().listen((user) async {
      if (user == null) {
        changeStatus(AuthState.UnAuthorized);
      } else {
        fUser = user;
        if (isGoogle != null) {
          await LoginRepository().fetchLoginInfo(user, isGoogle!);
          _login();
        }
      }
    });
  }

  AuthState get authState => state;

  login() async {
    var token = await dioRepository.setToken();
    if (!await checkToken()) {
      token = '';
    }
    if (token == '') {
      _auth.signOut();
    } else {
      dioRepository.setToken(token: token);
      _login();
    }
  }

  logoff() {
    dioRepository.setTokenToDefault();
    _auth.signOut();
  }

  checkToken() async {
    return await LoginRepository().checkValid();
  }

  _login() async {
    var user = await LoginRepository().getUserInfo();
    if (user == null) {
      changeStatus(AuthState.UnAuthorized);
    } else {
      //1 bval birthday asuuna, 2 bval skipped, 0 bval nasaa oruultsan
      if (user.skipBirthDate != '1') {
        changeStatus(AuthState.AuthorizedAge);
      } else {
        changeStatus(AuthState.Authorized);
      }
    }
  }

  changeStatus(AuthState status) async {
    state = status;
  }

  loginGoogle() async {
    isGoogle = true;
    changeStatus(AuthState.Authorizing);
    try {
      if (fUser == null) {
        GoogleSignIn googleSignIn = GoogleSignIn();
        GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount!.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        _auth.signInWithCredential(credential);
      } else {
        await LoginRepository().fetchLoginInfo(fUser, isGoogle!);
        _login();
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      changeStatus(AuthState.UnAuthorized);
    }
  }

  loginFacebook() async {
    isGoogle = false;
    changeStatus(AuthState.Authorizing);
    try {
      if (fUser == null) {
        LoginResult result = await FacebookAuth.instance.login();
        if (result.status == LoginStatus.success) {
          AuthCredential credential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          await _auth.signInWithCredential(credential);
        } else {
          dioRepository.snackBar(result.message!);
          changeStatus(AuthState.UnAuthorized);
        }
      } else {
        await LoginRepository().fetchLoginInfo(fUser, isGoogle!);
        _login();
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      changeStatus(AuthState.UnAuthorized);
    }
  }
}
