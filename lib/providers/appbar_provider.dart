// ignore_for_file: constant_identifier_names

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/models/Landing/app_bar_data.dart';

// enum AppBarState { Home, Course, Video, Blog, Profile }

class AppBarState {
  bool? isRichText;
  String? title;
  double? height;
  String? text;
  AppBarData? appBarData;
  AppBarState(
      {this.isRichText = true, this.title, this.height = 130, this.appBarData,this.text});
}

final appbarProvider =
    StateNotifierProvider<AppBarViewModel, AppBarState>((ref) {
  return AppBarViewModel();
});

class AppBarViewModel extends StateNotifier<AppBarState> {
  AppBarViewModel() : super(AppBarState());

  AppBarState get appBarState => state;

  changeStatus(AppBarState status) async {
    state = status;
  }
}
