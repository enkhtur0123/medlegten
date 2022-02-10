import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/pages/CoursePages/courses/landing_course.dart';
import 'package:medlegten/pages/ProfilePages/landing_profile.dart';
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
        const Center(
          child: Text("Index 2", style: TextStyle(color: Colors.black)),
        ),
        const Center(
          child: Text("Index 3", style: TextStyle(color: Colors.black)),
        ),
        LandingProfile(),
      ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this, initialIndex: 0);
    ref.read(appbarProvider.notifier).changeStatus(AppBarState(
          height: 130,
          isRichText: true,
          text1:
              "Сайн уу, ${ref.read(authProvider.notifier).userInfo!.firstName} 👋\n",
          text2: "Today’s Goal:",
          text3: ' A1 UNIT - Reading',
        ));
    tabController!.addListener(() {
      if (tabController!.indexIsChanging) {
        if (tabController!.index == 0) {
          ref.read(appbarProvider.notifier).changeStatus(AppBarState(
                height: 130,
                isRichText: true,
                text1:
                    "Сайн уу, ${ref.read(authProvider.notifier).userInfo!.firstName} 👋\n",
                text2: "Today’s Goal:",
                text3: ' A1 UNIT - Reading',
              ));
        }
        if (tabController!.index == 1) {
          ref.read(appbarProvider.notifier).changeStatus(AppBarState(
              height: 110,
              isRichText: false,
              text1: "Өнөөдрийн хичээлдээ бэлэн үү? ✍️"));
        }
        if (tabController!.index == 2) {
          ref
              .read(appbarProvider.notifier)
              .changeStatus(AppBarState(height: 110, isRichText: false,text1: "Have fun!"));
        }
        if (tabController!.index == 3) {
          ref
              .read(appbarProvider.notifier)
              .changeStatus(AppBarState(height: 110, isRichText: false, text1: "Have fun!"));
        }
        if (tabController!.index == 4) {
          ref
              .read(appbarProvider.notifier)
              .changeStatus(AppBarState(height: 110, isRichText: false, text1: "Have fun!"));
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
              text: "Курс"),
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
