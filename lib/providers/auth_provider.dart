// ignore_for_file: constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:medlegten/models/Starting/muser_info.dart';
import 'package:medlegten/repositories/login_repository.dart';
import 'package:medlegten/repositories/repository.dart';

enum AuthState { UnAuthorized, Authorizing, Authorized, AuthorizedAge, Initial }

final authProvider = StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel();
});

class AuthViewModel extends StateNotifier<AuthState> {
  final FirebaseAuth _auth;
  bool? isGoogle;
  User? user;
  Map<String, dynamic>? fUser;
  GoogleSignInAccount? googleSignInAccount;
  GoogleSignIn? googleSignIn;
  FacebookAuth? facebookAuth;
  MUserInfo? userInfo;

  AuthViewModel()
      : _auth = FirebaseAuth.instance,
        googleSignIn = GoogleSignIn(),
        facebookAuth = FacebookAuth.instance,
        super(AuthState.Initial) {
    _auth.authStateChanges().listen((user) async {
      if (user == null) {
        changeStatus(AuthState.UnAuthorized);
      } else {
        user = user;
        if (isGoogle != null) {
          await LoginRepository().fetchLoginInfo(
              user: user,
              isGoogle: isGoogle!,
              googleSignInAccount: googleSignInAccount,
              fUser: fUser);
          _login();
        }
      }
    });
  }

  ///Auth State Буцаах
  AuthState get authState => state;

  login() async {
    var token = await GetStorage().read("token") ?? "";
    if (token != "" && !await checkToken()) {
      token = '';
    }
    if (token == '') {
      _auth.signOut();
    } else {
      _login();
    }
  }

  logoff() async {
    await _auth.signOut();
    if (facebookAuth != null) {
      await facebookAuth!.logOut();
    }
    if (googleSignIn != null) {
      await googleSignIn!.signOut();
    }
    await changeStatus(AuthState.UnAuthorized);
    await GetStorage().remove('token');
    user = null;
  }

  /// Токен идэвхитэй эсэх
  checkToken() async {
    return await LoginRepository().checkValid();
  }

  _login() async {
    var user = await LoginRepository().getUserInfo();
    userInfo = user;
    if (user == null) {
      changeStatus(AuthState.UnAuthorized);
    } else {
      //1 bval birthday asuuna, 2 bval skipped, 0 bval nasaa oruultsan
      if (user.skipBirthDate != '1') {
        changeStatus(AuthState.AuthorizedAge);
      } else {
        // print(user);
        changeStatus(AuthState.Authorized);
      }
    }
  }

  /// Төлөв солих
  changeStatus(AuthState status) async {
    state = status;
  }

  loginGoogle() async {
    isGoogle = true;
    changeStatus(AuthState.Authorizing);
    try {
      if (user == null) {
        googleSignInAccount = await googleSignIn!.signIn();
        // print(googleSignInAccount.toString());
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount!.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        _auth.signInWithCredential(credential);
      } else {
        await LoginRepository().fetchLoginInfo(
            user: user,
            isGoogle: isGoogle!,
            googleSignInAccount: googleSignInAccount);
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
      if (user == null) {
        LoginResult result = await facebookAuth!.login();
        fUser = await facebookAuth!.getUserData();
        if (result.status == LoginStatus.success) {
          AuthCredential credential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          await _auth.signInWithCredential(credential);
        } else {
          dioRepository.snackBar(result.message!);
          changeStatus(AuthState.UnAuthorized);
        }
      } else {
        await LoginRepository()
            .fetchLoginInfo(user: user, isGoogle: isGoogle!, fUser: fUser);
        _login();
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      changeStatus(AuthState.UnAuthorized);
    }
  }
}
