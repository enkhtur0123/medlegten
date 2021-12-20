import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/models/app_user.dart';
import 'package:medlegten/models/version.dart';
import 'package:medlegten/repositories/rep_state.dart';
import 'package:medlegten/repositories/repository.dart';

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, RepState<Version>>(
  (ref) => LoginNotifier(
    loginRepository: ref.watch(_loginRepositoryProvider),
  ),
);

//* Repository
final _loginRepositoryProvider = Provider<ILoginRepository>(
  (ref) => LoginRepository(),
);

class LoginNotifier extends StateNotifier<RepState<Version>> {
  LoginNotifier({
    required ILoginRepository loginRepository,
  })  : _loginRepository = loginRepository,
        super(const RepState.initial());

  final ILoginRepository _loginRepository;

  Future<void> getAppVersion() async {
    state = const RepState.loading();

    try {
      final version = await _loginRepository.getAppVersion();
      if (version.isSuccess) state = RepState<Version>.data(data: version);
    } catch (_) {
      state = const RepState<Version>.error('Error');
    }
  }
}

abstract class ILoginRepository {
  Future<Version> getAppVersion();
}

class LoginRepository implements ILoginRepository {
  @override
  Future<Version> getAppVersion() async {
    try {
      final response = await dioRepository.instance.get('Login/Version');
      final res = json.decode('$response');

      return Version.fromJson(res);
    } catch (e) {
      return Version(false, e.hashCode.toString(), e.toString());
    }
  }

  Future fetchLoginInfo(User fbuser) async {
    try {
      final response = await dioRepository.instance.post(
        'Login',
        data: json.encode({
          'userId': fbuser.uid,
          'token': 'this is intentionally missed',
          'firstName': fbuser.displayName,
          'lastName': fbuser.email,
          'profileUrl': fbuser.photoURL,
          'socialType': 'facebook', //DO IT
          'deviceInfo': 'Android', //DO IT
          'channel': 'app'
        }),
      );

      final res = json.decode('$response');
      if (res['isSuccess']) {
        GetStorage().write('token', res['token']);
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
    }
  }

  Future getSliderInfo() async {
    try {
      final response = await dioRepository.instance.get('Login/Slider');
      final res = json.decode('$response');
      if (res['isSuccess']) {
        return;
      } else {
        return null;
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
    }
  }

  Future<AppUser?> getUserInfo() async {
    try {
      return AppUser(1,
          name: 'Enkhtur',
          email: 'enkhtur0123@gmail.com',
          birthday: DateTime(1980, 01, 23),
          gender: 'Эр',
          age: -1);
    } catch (e) {
      return null;
    }
  }
}
