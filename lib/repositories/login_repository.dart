import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/models/Starting/muser_info.dart';
import 'package:medlegten/models/Starting/onboarding.dart';
import 'package:medlegten/models/Starting/version.dart';
import 'package:medlegten/repositories/rep_state.dart';
import 'package:medlegten/repositories/repository.dart';
import 'package:medlegten/services/custom_exception.dart';
import 'package:medlegten/services/http_helper.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, RepState>(
  (ref) => LoginNotifier(
    loginRepository: ref.watch(_loginRepositoryProvider),
  ),
);

//* Repository
final _loginRepositoryProvider = Provider<ILoginRepository>(
  (ref) => LoginRepository(),
);

class LoginNotifier extends StateNotifier<RepState> {
  LoginNotifier({
    required ILoginRepository loginRepository,
  })  : _loginRepository = loginRepository,
        super(const RepState.loading());

  final ILoginRepository _loginRepository;

  Future<void> getAppVersion() async {
    state = const RepState.loading();

    try {
      final version = await _loginRepository.getAppVersion();
      if (version != null) {
        state = RepState.data(data: version);
      } else {
        state = const RepState.error('Error');
      }
    } catch (_) {
      state = const RepState.error('Error');
    }
  }

  Future<void> getOnboardingInfo() async {
    state = const RepState.loading();

    try {
      final dataInfo = await _loginRepository.getOnboardingInfo();
      if (dataInfo != null) {
        state = RepState.data(data: dataInfo);
      } else {
        state = const RepState.error('Error');
      }
    } catch (_) {
      state = const RepState.error('Error');
    }
  }
}

abstract class ILoginRepository {
  Future<Version?> getAppVersion();

  Future<List<Onboarding>?> getOnboardingInfo();
}

class LoginRepository implements ILoginRepository {
  @override
  Future<Version?> getAppVersion() async {
    try {
      final res = await HttpHelper().getUrl(
          url: 'Login/Version',
          token:
              "T0rr2flSZvRRwkZJMFMPLGttmZLDJS2pIfTg2yvYMiJNy5OXNptODn28TiJ1tZeV");
      if (res['isSuccess']) {
        return Version.fromJson(res);
      } else {
        return null;
      }
    } catch (e) {
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  @override
  Future<List<Onboarding>?> getOnboardingInfo() async {
    try {
      final res = await HttpHelper().getUrl(url: 'Login/Slider');
      // print(res);
      if (res['isSuccess']) {
        var list = res['onBoarding'] as List;
        // print(list);

        return list.map((i) => Onboarding.fromJson(i)).toList();
      } else {
        return null;
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future fetchLoginInfo(
      {User? user,
      bool? isGoogle,
      bool isApple = false,
      Map<String, dynamic>? fUser,
      GoogleSignInAccount? googleSignInAccount,
      AuthorizationCredentialAppleID? credentialAppleID,
      String? userIdentifier,
      bool? isGuest = false}) async {
    try {
      if (user != null || isGuest!) {
        final res = await HttpHelper().postUrl(
          url: 'Login',
          body: !isGuest!
              ? json.encode({
                  'userId':
                      !isApple ? user!.providerData.first.uid : userIdentifier,
                  'firstName': !isApple
                      ? (isGoogle!
                          ? googleSignInAccount!.displayName
                          : fUser!["name"])
                      : credentialAppleID!.givenName,
                  'lastName': !isApple
                      ? (isGoogle!
                          ? googleSignInAccount!.displayName
                          : fUser!["name"])
                      : credentialAppleID!.familyName,
                  'profileUrl': !isApple
                      ? (isGoogle!
                          ? googleSignInAccount!.photoUrl
                          : fUser!["picture"]["data"]["url"])
                      : "",
                  'socialType':
                      !isApple ? (isGoogle! ? 'google' : 'facebook') : "apple",
                  'deviceInfo': Platform.operatingSystem, //DO IT
                  'channel': 'app',
                  'email': !isApple
                      ? (isGoogle!
                          ? googleSignInAccount!.email
                          : fUser!["email"])
                      : credentialAppleID!.email,
                  'birthDate': ''
                })
              : json.encode({
                  "socialType": "guest",
                  "deviceInfo": Platform.operatingSystem,
                  "channel": "guest"
                }),
        );
        if (res['isSuccess']) {
          GetStorage().write('token', res['token']);
          // print(res['token']);
        }
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());

      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future<MUserInfo?> getUserInfo() async {
    try {
      final res = await HttpHelper().getUrl(url: 'UserInfo');
      if (res['isSuccess']) {
        return MUserInfo.fromJson(res['userInfo']);
      } else {
        return null;
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future<bool> checkValid() async {
    try {
      final res = await HttpHelper().getUrl(url: 'UserInfo');
      if (res['errorCode'] == 401) {
        await GetStorage().remove("token");
      }
      return res['errorCode'] == '200';
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  Future<bool> setBirth(String? birthdate) async {
    try {
      final res =
          await HttpHelper().getUrl(url: 'UserInfo/BirthDate/$birthdate');
      if (res['errorCode'] == 401) {
        await GetStorage().remove("token");
      }
      return res['errorCode'] == '200';
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      throw CustomException(errorMsg: e.toString().toUpperCase());
    }
  }

  // Future<String> getUserInfoBirthDate() async {
  //   try {
  //     final response = await dioRepository.instance.post('UserInfo/BDATE',data: json.encode({
  //         'userId': fbuser.uid,
  //         'firstName': fbuser.displayName,
  //         'lastName': fbuser.displayName,
  //         'profileUrl': fbuser.photoURL,
  //         'socialType': 'facebook', //DO IT
  //         'deviceInfo': 'Android', //DO IT
  //         'channel': 'app',
  //         'email': fbuser.email,
  //         'birthDate': birthDate
  //       }),);
  //     final res = json.decode('$response');
  //     if (res['isSuccess']) {
  //       return MUserInfo.fromJson(res['userInfo']);
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     dioRepository.snackBar(e.toString().toUpperCase());
  //     return null;
  //   }
  // }
}
