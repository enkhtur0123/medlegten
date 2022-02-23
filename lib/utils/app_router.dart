import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medlegten/models/Landing/article_info.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/models/Starting/onboarding.dart';
import 'package:medlegten/models/Unit/reading.dart';
import 'package:medlegten/models/Unit/unit_conversation_video.dart';
import 'package:medlegten/models/Unit/unit_grammar.dart';
import 'package:medlegten/models/Unit/unit_introduction_video.dart';
import 'package:medlegten/models/Unit/unit_listening_quiz_question.dart';
import 'package:medlegten/models/Unit/unit_mixed_video.dart';
import 'package:medlegten/models/Unit/unit_writing.dart';
import 'package:medlegten/models/video/movie.dart';
import 'package:medlegten/models/video/payment_info.dart';
import 'package:medlegten/pages/BlogPage/ArticleDetail/article_detail_page.dart';
import 'package:medlegten/pages/BlogPage/article_vertical_page.dart';
import 'package:medlegten/pages/CoursePages/Unit_conversationVideo/conversation_video_page.dart';
import 'package:medlegten/pages/CoursePages/Unit_grammarTable/grammar_page.dart';
import 'package:medlegten/pages/CoursePages/Unit_introVideo/intro_video_page.dart';
import 'package:medlegten/pages/CoursePages/Unit_listening/module_listening.dart';
import 'package:medlegten/pages/CoursePages/Unit_mixedVideo/mixed_video_page.dart';
import 'package:medlegten/pages/CoursePages/Unit_reading/reading_page.dart';
import 'package:medlegten/pages/CoursePages/Unit_test/unit_test_page.dart';
import 'package:medlegten/pages/CoursePages/Unit_vocabolary/vocabulary_list.dart';
import 'package:medlegten/pages/CoursePages/Unit_writing/writing_video_page.dart';
import 'package:medlegten/pages/CoursePages/course_self_test/course_self_test.dart';
import 'package:medlegten/pages/CoursePages/course_unit_module_list/course_unit_module_list.dart';
import 'package:medlegten/pages/CoursePages/courses/course_detail.dart';
import 'package:medlegten/pages/CoursePages/payment/buy_course.dart';
import 'package:medlegten/pages/CoursePages/payment/qpay_page.dart';
import 'package:medlegten/pages/LandingPages/landing_page.dart';
import 'package:medlegten/pages/StartPages/age.dart';
import 'package:medlegten/pages/StartPages/login.dart';
import 'package:medlegten/pages/StartPages/onboarding_page.dart';
import 'package:medlegten/pages/StartPages/start.dart';
import 'package:medlegten/pages/VideoPage/level_video_list.dart';

import 'package:medlegten/pages/VideoPage/video_detail.dart';
import 'package:medlegten/pages/VideoPage/vocabulary_list.dart';
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
    AutoRoute(path: '/writing_video_page', page: WritingVideoPage),
    AutoRoute(path: '/conversation_video_page', page: ConversationVideoPage),
    AutoRoute(path: '/payment', page: PaymentPage),
    AutoRoute(path: '/qpay', page: QpayPage),
    AutoRoute(path: '/vocabulary_list', page: VocabularyListPage),
    AutoRoute(path: '/level/event/list', page: LevelVideoListPage),
    AutoRoute(path: '/video/detail', page: VideoDetailPage),
    AutoRoute(path: '/video/vocabulary_list', page: VideoVocabularyListPage),
    AutoRoute(path: '/unit_test_page', page: UnitTestPage),
    AutoRoute(path: '/blog/all', page: ArticleVerticalPage),
    AutoRoute(
        path: '/blog/articledetail/article_detail_page', page: ArticlePage),
    // QpayPage
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
