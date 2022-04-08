// ignore_for_file: constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:medlegten/models/Landing/app_bar_data.dart';
import 'package:medlegten/models/Starting/muser_info.dart';
import 'package:medlegten/repositories/landing_repository.dart';
import 'package:medlegten/repositories/login_repository.dart';
import 'package:medlegten/repositories/repository.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

enum AuthState { UnAuthorized, Authorizing, Authorized, AuthorizedAge, Initial }

final authProvider = StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel();
});

class AuthViewModel extends StateNotifier<AuthState> {
  final FirebaseAuth _auth;
  bool? isGoogle;
  bool? isApple = false;
  bool? isGuest = false;
  User? user;
  Map<String, dynamic>? fUser;
  GoogleSignInAccount? googleSignInAccount;
  GoogleSignIn? googleSignIn;
  FacebookAuth? facebookAuth;
  MUserInfo? userInfo;
  AppBarData? appBarData;
  AuthorizationCredentialAppleID? authorizationCredentialAppleID;
  Map<String, dynamic>? appleData;

  AuthViewModel()
      : _auth = FirebaseAuth.instance,
        googleSignIn = GoogleSignIn(),
        facebookAuth = FacebookAuth.instance,
        super(AuthState.Initial) {
    _auth.authStateChanges().listen((user) async {
      if (user == null) {
        try {
          await GetStorage().remove('token');
        } catch (Ex) {}

        changeStatus(AuthState.UnAuthorized);
      } else {
        user = user;
        if (isGoogle != null) {
          await LoginRepository().fetchLoginInfo(
              user: user,
              isGoogle: isGoogle!,
              googleSignInAccount: googleSignInAccount,
              isApple: isApple!,
              userIdentifier:
                  authorizationCredentialAppleID?.userIdentifier ?? null,
              credentialAppleID: authorizationCredentialAppleID,
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
    if (GetStorage().hasData("isGuest")) {
      changeStatus(AuthState.UnAuthorized);
    } else {
      if (token != "" && !await checkToken()) {
        token = '';
      }
      if (token == '') {
        _auth.signOut();
      } else {
        _login();
      }
    }
  }

  logoff() async {
    try {
      await _auth.signOut();
      if (facebookAuth != null) {
        await facebookAuth!.logOut();
      }
      if (googleSignIn != null) {
        await googleSignIn!.signOut();
      }
    } catch (ex) {}
    await changeStatus(AuthState.UnAuthorized);
    await GetStorage().remove('token');
    user = null;
    userInfo = null;
  }

  /// Токен идэвхитэй эсэх
  checkToken() async {
    return await LoginRepository().checkValid();
  }

  _login() async {
    var user = await LoginRepository().getUserInfo();
    // print(appBarData);
    userInfo = user;
    if (user == null) {
      changeStatus(AuthState.UnAuthorized);
    } else {
      appBarData = await LandingRepository().getAppbarData();
      //1 bval birthday asuuna, 2 bval skipped, 0 bval nasaa oruultsan
      if (user.skipBirthDate != '0') {
        changeStatus(AuthState.AuthorizedAge);
      } else {
        await GetStorage().remove("isGuest");
        isGuest = false;
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
    try {
      await GetStorage().remove('token');
      await GetStorage().remove("isGuest");
    } catch (ex) {}

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

  loginGuest() async {
    try {
      await GetStorage().remove('token');
    } catch (Ex) {}

    isGoogle = false;
    isApple = false;
    isGuest = true;
    changeStatus(AuthState.Authorizing);
    try {
      await LoginRepository().fetchLoginInfo(
        isGoogle: false,
        isGuest: true,
        isApple: false,
      );
      await GetStorage().write("isGuest", true);
      var user = await LoginRepository().getUserInfo();
      // print(appBarData);
      userInfo = user;
      changeStatus(AuthState.Authorized);
    } catch (ex) {
      changeStatus(AuthState.UnAuthorized);
      throw CustomException(errorMsg: "Түр хүлээгээд дахин оролдоно уу");
    }
  }

  loginApple() async {
    try {
      await GetStorage().remove('token');
      await GetStorage().remove("isGuest");
    } catch (Ex) {}

    isGoogle = false;
    isApple = true;
    changeStatus(AuthState.Authorizing);
    try {
      if (user == null) {
        authorizationCredentialAppleID =
            await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
        );
        final oauthCredential = OAuthProvider("apple.com").credential(
          idToken: authorizationCredentialAppleID!.identityToken,
        );
        _auth.signInWithCredential(oauthCredential);
        // print(authorizationCredentialAppleID!.userIdentifier);
      } else {
        await LoginRepository().fetchLoginInfo(
          credentialAppleID: authorizationCredentialAppleID,
          isApple: true,
          isGoogle: isGoogle!,
          userIdentifier: authorizationCredentialAppleID!.userIdentifier,
        );
        _login();
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      changeStatus(AuthState.UnAuthorized);
    }
  }

  loginFacebook() async {
    try {
      await GetStorage().remove('token');
      await GetStorage().remove("isGuest");
    } catch (ex) {}

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
      // print(e.toString());
      dioRepository.snackBar(e.toString().toUpperCase());
      changeStatus(AuthState.UnAuthorized);
    }
  }
}
