import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Starting/onboarding.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_conversationVideo/module_conversation_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/module_grammar_table.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/main_page.dart';
import 'package:medlegten/pages/CoursePages/Unit_listening/module_listening.dart';
import 'package:medlegten/pages/CoursePages/Unit_mixedVideo/module_mixed_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_progressExam/module_progress_exam.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/module_reading.dart';
import 'package:medlegten/pages/CoursePages/Unit_writing/module_writing.dart';
import 'package:medlegten/pages/CoursePages/course_detail.dart';
import 'package:medlegten/pages/CoursePages/course_self_test.dart';
import 'package:medlegten/pages/CoursePages/course_unit_module_list.dart';
import 'package:medlegten/pages/LandingPages/landing_page.dart';
import 'package:medlegten/pages/StartPages/age.dart';
import 'package:medlegten/pages/StartPages/login.dart';
import 'package:medlegten/pages/StartPages/onboarding_page.dart';
import 'package:medlegten/pages/StartPages/start.dart';
import 'package:medlegten/pages/home.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/home', page: HomePage, initial: true),
    AutoRoute(path: '/onboarding', page: OnboardingPage),
    AutoRoute(path: '/login', page: LoginPage),
    AutoRoute(path: '/age', page: AgePage),
    AutoRoute(path: '/start', page: StartPage),
    AutoRoute(path: '/landing', page: LandingPage),
    AutoRoute(path: '/course_self_test', page: CourseSelfTestPage),
    AutoRoute(path: '/course_detail', page: CourseDetailPage),
    AutoRoute(path: '/course_unit_module_list', page: CourseUnitModuleListPage),
    AutoRoute(path: '/unit_module_grammartable', page: ModuleGrammarTablePage),
    AutoRoute(
        path: '/Unit_introVideo/main_page', page: CourseUnitIntroVideoPage),
    AutoRoute(path: '/unit_module_mixedvideo', page: ModuleMixedVideoPage),
    AutoRoute(path: '/unit_module_reading', page: ModuleReadingPage),
    AutoRoute(path: '/unit_module_listening', page: ModuleListenPage),
    AutoRoute(path: '/unit_module_writing', page: ModuleWritingPage),
    AutoRoute(
        path: '/unit_module_conversationvideo',
        page: ModuleConversationVideoPage),
    AutoRoute(path: '/unit_module_progressexam', page: ModuleProgressExamPage),
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {}
