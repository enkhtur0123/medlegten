import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/models/Starting/version.dart';
import 'package:medlegten/repositories/unit_repository.dart';

class VersionState {
  Version? version;
  VersionState({this.version});
}

final appProvider = StateNotifierProvider<AppViewModel, VersionState>((ref) {
  return AppViewModel();
});

class AppViewModel extends StateNotifier<VersionState> {
  AppViewModel() : super(VersionState());
  VersionState get versionState => state;

  changeState({VersionState? value}) {
    state = value!;
  }
}

final wordCountProvider = FutureProvider<int>((ref) async {
  final result = await UnitRepository().getWordCount(0);
  return result;
});
