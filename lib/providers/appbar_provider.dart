// ignore_for_file: constant_identifier_names

import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AppBarState { Home, Course, Video, Blog, Profile }

final appbarProvider =
    StateNotifierProvider<AppBarViewModel, AppBarState>((ref) {
  return AppBarViewModel();
});

class AppBarViewModel extends StateNotifier<AppBarState> {
  AppBarViewModel() : super(AppBarState.Home);

  bool? isRichText = true;
  String? title = "";
  double height = 130;

  AppBarState get appBarState => state;

  changeStatus(AppBarState status) async {
    state = status;
  }

  changeHeight({double? height}) {
    height = height;
  }

  changeIsRichText({bool? value}) {
    isRichText = value;
  }
}
