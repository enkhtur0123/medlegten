import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/pages/BlogPage/index.dart';
import 'package:medlegten/pages/CoursePages/courses/landing_course.dart';
import 'package:medlegten/pages/ProfilePages/landing_profile.dart';
import 'package:medlegten/pages/VideoPage/index.dart';
import 'package:medlegten/pages/app_bar.dart';
import 'package:medlegten/providers/appbar_provider.dart';
import 'package:medlegten/providers/auth_provider.dart';
import 'landing_home.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return LandingPageState();
  }
}

class LandingPageState extends ConsumerState<LandingPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  // ignore: prefer_final_fields
  ValueNotifier<int>? _index = ValueNotifier(0);

  List<Widget> get pages => [
        const LandingHome(),
        const LandingCourse(),
        const VideoPage(),
        BlogPage(),
        LandingProfile(),
      ];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this, initialIndex: 0);
    changeAppBarData(
        ref: ref,
        height: 120,
        appbarProvider: appbarProvider,
        authProvider: authProvider,
        text:
            "${ref.read(authProvider.notifier).appBarData?.homePageText ?? ""} 👋\n");
    tabController!.addListener(() {
      if (tabController!.indexIsChanging) {
        if (tabController!.index == 0) {
          changeAppBarData(
              ref: ref,
              height: 120,
              appbarProvider: appbarProvider,
              authProvider: authProvider,
              text:
                  "${ref.read(appbarProvider.notifier).appBarState.appBarData?.homePageText ?? ""} 👋\n");
        }
        if (tabController!.index == 1) {
          changeAppBarData(
              ref: ref,
              height: 120,
              appbarProvider: appbarProvider,
              authProvider: authProvider,
              text:
                  "${ref.read(appbarProvider.notifier).appBarState.appBarData?.coursePageText ?? ""} ✍️");
        }
        if (tabController!.index == 2) {
          changeAppBarData(
              ref: ref,
              height: 120,
              appbarProvider: appbarProvider,
              authProvider: authProvider,
              text: ref
                      .read(appbarProvider.notifier)
                      .appBarState
                      .appBarData
                      ?.ppvPageText ??
                  "");
        }
        if (tabController!.index == 3) {
          changeAppBarData(
              ref: ref,
              height: 120,
              appbarProvider: appbarProvider,
              authProvider: authProvider,
              text: ref
                      .read(appbarProvider.notifier)
                      .appBarState
                      .appBarData
                      ?.articlePageText ??
                  "");
        }
        if (tabController!.index == 4) {
          changeAppBarData(
              ref: ref,
              height: 120,
              appbarProvider: appbarProvider,
              authProvider: authProvider,
              text: "Have fun!");
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey();

    return Scaffold(
      appBar: CustomAppBar(
        ref: ref,
      ),
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            key: _key,
            controller: tabController,
            children: pages.map((e) {
              return e;
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: TabBar(
        isScrollable: false,
        labelPadding: const EdgeInsets.all(5),
        indicatorColor: const Color(0xff30359F),
        unselectedLabelColor: const Color(0xff30359F).withOpacity(0.5),
        tabs: [
          getTab(
              index: 0,
              imgUrl:
                  "assets/img/Landing/${0 == _index!.value ? "selected" : "unselected"}/home.svg",
              text: "Нүүр"),
          getTab(
              index: 1,
              imgUrl:
                  "assets/img/Landing/${1 == _index!.value ? "selected" : "unselected"}/course.svg",
              text: "Хөтөлбөр"),
          getTab(
              index: 2,
              imgUrl:
                  "assets/img/Landing/${2 == _index!.value ? "selected" : "unselected"}/video.svg",
              text: "Видео"),
          getTab(
              index: 3,
              imgUrl:
                  "assets/img/Landing/${3 == _index!.value ? "selected" : "unselected"}/blog.svg",
              text: "Нийтлэл"),
          getTab(
              index: 4,
              imgUrl:
                  "assets/img/Landing/${4 == _index!.value ? "selected" : "unselected"}/user.svg",
              text: "Миний"),
        ],
        onTap: (index) {
          _index!.value = index;
          setState(() {});
        },
        controller: tabController,
        labelColor: const Color(0xff30359F),
        labelStyle: const TextStyle(
          color: Color(0xff30359F),
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        unselectedLabelStyle: TextStyle(
          color: const Color(0xff30359F).withOpacity(0.5),
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  getTab({int? index, String? imgUrl, String? text}) {
    return Tab(
      icon: SvgPicture.asset(
        imgUrl!,
        height: 20,
        width: 20,
        color: const Color(0xff30359F),
      ),
      text: text,
    );
  }
}

changeAppBarData(
    {StateNotifierProvider<AppBarViewModel, AppBarState>? appbarProvider,
    StateNotifierProvider<AuthViewModel, AuthState>? authProvider,
    WidgetRef? ref,
    double? height,
    String? text}) {
  ref!.read(appbarProvider!.notifier).changeStatus(
        AppBarState(
          height: 120,
          appBarData: ref.read(authProvider!.notifier).appBarData,
          text: text,
        ),
      );
}
