import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Starting/onboarding.dart';
import 'package:medlegten/models/Unit/reading.dart';
import 'package:medlegten/models/Unit/unit_grammar.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/models/Unit/unit_listening_quiz_question.dart';
import 'package:medlegten/models/Unit/unit_mixed_video.dart';
import 'package:medlegten/pages/CoursePages/Unit_conversationVideo/conversation_video_page.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_page.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/intro_video_page.dart';
import 'package:medlegten/pages/CoursePages/Unit_listening/module_listening.dart';
import 'package:medlegten/pages/CoursePages/Unit_mixedVideo/mixed_video_page.dart';
import 'package:medlegten/pages/CoursePages/Unit_progressExam/module_progress_exam.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/reading_page.dart';
import 'package:medlegten/pages/CoursePages/Unit_vocabolary/vocabulary_list.dart';
import 'package:medlegten/pages/CoursePages/Unit_writing/module_writing.dart';
import 'package:medlegten/pages/CoursePages/course_self_test/course_self_test.dart';
import 'package:medlegten/pages/CoursePages/course_unit_module_list.dart';
import 'package:medlegten/pages/CoursePages/courses/course_detail.dart';
import 'package:medlegten/pages/CoursePages/payment/buy_course.dart';
import 'package:medlegten/pages/CoursePages/payment/qpay_page.dart';
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
    AutoRoute(path: '/grammar_page', page: GrammarTablePage),
    AutoRoute(path: '/intro_video_page', page: CourseUnitIntroVideoPage),
    AutoRoute(path: '/mixed_video_page', page: MixedVideoPage),
    AutoRoute(path: '/reading_page', page: ReadingPage),
    AutoRoute(path: '/unit_module_listening', page: ModuleListenPage),
    AutoRoute(path: '/unit_module_writing', page: ModuleWritingPage),
    AutoRoute(path: '/conversation_video_page', page: ConversationVideoPage),
    AutoRoute(path: '/unit_module_progressexam', page: ModuleProgressExamPage),
    AutoRoute(path: '/payment', page: CoursePaymentPage),
    AutoRoute(path: '/qpay', page: QpayPage),
    AutoRoute(path: '/vocabulary_list', page: VocabularyListPage),

    // QpayPage
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {}
