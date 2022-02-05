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
import 'package:medlegten/services/http_helper.dart';

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
      final res = await HttpHelper().getUrl(url: 'Login/Version');
      if (res['isSuccess']) {
        return Version.fromJson(res);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Onboarding>?> getOnboardingInfo() async {
    try {
      final res = await HttpHelper().getUrl(url: 'Login/Slider');
      if (res['isSuccess']) {
        var list = res['onBoarding'] as List;
        return list.map((i) => Onboarding.fromJson(i)).toList();
      } else {
        return null;
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }

  Future fetchLoginInfo(
      {User? user,
      bool? isGoogle,
      Map<String, dynamic>? fUser,
      GoogleSignInAccount? googleSignInAccount}) async {
    try {
      if (user != null) {
        final res = await HttpHelper().postUrl(
          url: 'Login',
          body: json.encode({
            'userId': user.providerData.first.uid,
            'firstName':  isGoogle!
                ? googleSignInAccount!.displayName
                : fUser!["name"],
            'lastName': isGoogle
                ? googleSignInAccount!.displayName
                : fUser!["name"],
            'profileUrl':  isGoogle
                ? googleSignInAccount!.photoUrl
                : fUser!["picture"]["data"]["url"],
            'socialType': isGoogle ? 'google' : 'facebook',
            'deviceInfo': Platform.operatingSystem, //DO IT
            'channel': 'app',
            'email':isGoogle
                ? googleSignInAccount!.email
                : fUser!["email"],
            'birthDate': ''
          }),
        );
        if (res['isSuccess']) {
          GetStorage().write('token', res['token']);
          // print(res['token']);
        }
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
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
      return null;
    }
  }

  Future<bool> checkValid() async {
    try {
      final res = await HttpHelper().getUrl(url: 'UserInfo');
      return res['errorCode'] == '200';
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      return false;
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
