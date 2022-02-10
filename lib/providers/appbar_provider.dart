// ignore_for_file: constant_identifier_names

import 'package:hooks_riverpod/hooks_riverpod.dart';

// enum AppBarState { Home, Course, Video, Blog, Profile }

class AppBarState {
  bool? isRichText;
  String? title;
  double? height;
  String? text1;
  String? text2;
  String? text3;
  AppBarState({this.isRichText = true, this.title, this.height = 130,this.text1,this.text2,this.text3});
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
