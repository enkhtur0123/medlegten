// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    OnboardingRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: OnboardingPage(
              onboardingList: args.onboardingList, key: args.key));
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    AgeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AgePage());
    },
    StartRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const StartPage());
    },
    LandingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LandingPage());
    },
    CourseSelfTestRoute.name: (routeData) {
      final args = routeData.argsAs<CourseSelfTestRouteArgs>(
          orElse: () => const CourseSelfTestRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: CourseSelfTestPage(key: args.key));
    },
    CourseDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CourseDetailRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CourseDetailPage(args.courseInfo, key: args.key));
    },
    CourseUnitModuleListRoute.name: (routeData) {
      final args = routeData.argsAs<CourseUnitModuleListRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CourseUnitModuleListPage(args.unitInfo, key: args.key));
    },
    GrammarTableRoute.name: (routeData) {
      final args = routeData.argsAs<GrammarTableRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: GrammarTablePage(
              args.unitGrammar, args.unitTitle, args.moduleId,
              key: args.key));
    },
    CourseUnitIntroVideoRoute.name: (routeData) {
      final args = routeData.argsAs<CourseUnitIntroVideoRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CourseUnitIntroVideoPage(
              args.unitTitle, args.unitIntroVideo, args.url, args.moduleId,
              key: args.key));
    },
    MixedVideoRoute.name: (routeData) {
      final args = routeData.argsAs<MixedVideoRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: MixedVideoPage(
              args.unitTitle, args.unitMixedVideo, args.url, args.moduleId,
              key: args.key));
    },
    ReadingRoute.name: (routeData) {
      final args = routeData.argsAs<ReadingRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ReadingPage(args.reading, args.unitTitle, args.moduleId,
              key: args.key));
    },
    ModuleListenRoute.name: (routeData) {
      final args = routeData.argsAs<ModuleListenRouteArgs>(
          orElse: () => const ModuleListenRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ModuleListenPage(
              key: args.key,
              unitInfo: args.unitInfo,
              listeningQuiz: args.listeningQuiz));
    },
    WritingVideoRoute.name: (routeData) {
      final args = routeData.argsAs<WritingVideoRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WritingVideoPage(args.unitWriting, key: args.key));
    },
    ConversationVideoRoute.name: (routeData) {
      final args = routeData.argsAs<ConversationVideoRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ConversationVideoPage(args.unitTitle,
              args.unitConversationVideo, args.url, args.moduleId,
              key: args.key));
    },
    ModuleProgressExamRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ModuleProgressExamPage());
    },
    CoursePaymentRoute.name: (routeData) {
      final args = routeData.argsAs<CoursePaymentRouteArgs>(
          orElse: () => const CoursePaymentRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CoursePaymentPage(key: args.key, courseInfo: args.courseInfo));
    },
    QpayRoute.name: (routeData) {
      final args =
          routeData.argsAs<QpayRouteArgs>(orElse: () => const QpayRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: QpayPage(
              key: args.key,
              courseInfo: args.courseInfo,
              couponCode: args.couponCode,
              price: args.price));
    },
    VocabularyListRoute.name: (routeData) {
      final args = routeData.argsAs<VocabularyListRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: VocabularyListPage(args.unit, args.unitTitle, key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        RouteConfig(HomeRoute.name, path: '/home'),
        RouteConfig(OnboardingRoute.name, path: '/onboarding'),
        RouteConfig(LoginRoute.name, path: '/login'),
        RouteConfig(AgeRoute.name, path: '/age'),
        RouteConfig(StartRoute.name, path: '/start'),
        RouteConfig(LandingRoute.name, path: '/landing'),
        RouteConfig(CourseSelfTestRoute.name, path: '/course_self_test'),
        RouteConfig(CourseDetailRoute.name, path: '/course_detail'),
        RouteConfig(CourseUnitModuleListRoute.name,
            path: '/course_unit_module_list'),
        RouteConfig(GrammarTableRoute.name, path: '/grammar_page'),
        RouteConfig(CourseUnitIntroVideoRoute.name, path: '/intro_video_page'),
        RouteConfig(MixedVideoRoute.name, path: '/mixed_video_page'),
        RouteConfig(ReadingRoute.name, path: '/reading_page'),
        RouteConfig(ModuleListenRoute.name, path: '/unit_module_listening'),
        RouteConfig(WritingVideoRoute.name, path: '/writing_video_page'),
        RouteConfig(ConversationVideoRoute.name,
            path: '/conversation_video_page'),
        RouteConfig(ModuleProgressExamRoute.name,
            path: '/unit_module_progressexam'),
        RouteConfig(CoursePaymentRoute.name, path: '/payment'),
        RouteConfig(QpayRoute.name, path: '/qpay'),
        RouteConfig(VocabularyListRoute.name, path: '/vocabulary_list')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<OnboardingRouteArgs> {
  OnboardingRoute({required List<Onboarding> onboardingList, Key? key})
      : super(OnboardingRoute.name,
            path: '/onboarding',
            args:
                OnboardingRouteArgs(onboardingList: onboardingList, key: key));

  static const String name = 'OnboardingRoute';
}

class OnboardingRouteArgs {
  const OnboardingRouteArgs({required this.onboardingList, this.key});

  final List<Onboarding> onboardingList;

  final Key? key;

  @override
  String toString() {
    return 'OnboardingRouteArgs{onboardingList: $onboardingList, key: $key}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [AgePage]
class AgeRoute extends PageRouteInfo<void> {
  const AgeRoute() : super(AgeRoute.name, path: '/age');

  static const String name = 'AgeRoute';
}

/// generated route for
/// [StartPage]
class StartRoute extends PageRouteInfo<void> {
  const StartRoute() : super(StartRoute.name, path: '/start');

  static const String name = 'StartRoute';
}

/// generated route for
/// [LandingPage]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/landing');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [CourseSelfTestPage]
class CourseSelfTestRoute extends PageRouteInfo<CourseSelfTestRouteArgs> {
  CourseSelfTestRoute({Key? key})
      : super(CourseSelfTestRoute.name,
            path: '/course_self_test', args: CourseSelfTestRouteArgs(key: key));

  static const String name = 'CourseSelfTestRoute';
}

class CourseSelfTestRouteArgs {
  const CourseSelfTestRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CourseSelfTestRouteArgs{key: $key}';
  }
}

/// generated route for
/// [CourseDetailPage]
class CourseDetailRoute extends PageRouteInfo<CourseDetailRouteArgs> {
  CourseDetailRoute({required CourseInfo courseInfo, Key? key})
      : super(CourseDetailRoute.name,
            path: '/course_detail',
            args: CourseDetailRouteArgs(courseInfo: courseInfo, key: key));

  static const String name = 'CourseDetailRoute';
}

class CourseDetailRouteArgs {
  const CourseDetailRouteArgs({required this.courseInfo, this.key});

  final CourseInfo courseInfo;

  final Key? key;

  @override
  String toString() {
    return 'CourseDetailRouteArgs{courseInfo: $courseInfo, key: $key}';
  }
}

/// generated route for
/// [CourseUnitModuleListPage]
class CourseUnitModuleListRoute
    extends PageRouteInfo<CourseUnitModuleListRouteArgs> {
  CourseUnitModuleListRoute({required CourseUnit unitInfo, Key? key})
      : super(CourseUnitModuleListRoute.name,
            path: '/course_unit_module_list',
            args: CourseUnitModuleListRouteArgs(unitInfo: unitInfo, key: key));

  static const String name = 'CourseUnitModuleListRoute';
}

class CourseUnitModuleListRouteArgs {
  const CourseUnitModuleListRouteArgs({required this.unitInfo, this.key});

  final CourseUnit unitInfo;

  final Key? key;

  @override
  String toString() {
    return 'CourseUnitModuleListRouteArgs{unitInfo: $unitInfo, key: $key}';
  }
}

/// generated route for
/// [GrammarTablePage]
class GrammarTableRoute extends PageRouteInfo<GrammarTableRouteArgs> {
  GrammarTableRoute(
      {required UnitGrammar unitGrammar,
      required String unitTitle,
      required String moduleId,
      Key? key})
      : super(GrammarTableRoute.name,
            path: '/grammar_page',
            args: GrammarTableRouteArgs(
                unitGrammar: unitGrammar,
                unitTitle: unitTitle,
                moduleId: moduleId,
                key: key));

  static const String name = 'GrammarTableRoute';
}

class GrammarTableRouteArgs {
  const GrammarTableRouteArgs(
      {required this.unitGrammar,
      required this.unitTitle,
      required this.moduleId,
      this.key});

  final UnitGrammar unitGrammar;

  final String unitTitle;

  final String moduleId;

  final Key? key;

  @override
  String toString() {
    return 'GrammarTableRouteArgs{unitGrammar: $unitGrammar, unitTitle: $unitTitle, moduleId: $moduleId, key: $key}';
  }
}

/// generated route for
/// [CourseUnitIntroVideoPage]
class CourseUnitIntroVideoRoute
    extends PageRouteInfo<CourseUnitIntroVideoRouteArgs> {
  CourseUnitIntroVideoRoute(
      {required String unitTitle,
      required UnitIntroVideo unitIntroVideo,
      required String url,
      required String moduleId,
      Key? key})
      : super(CourseUnitIntroVideoRoute.name,
            path: '/intro_video_page',
            args: CourseUnitIntroVideoRouteArgs(
                unitTitle: unitTitle,
                unitIntroVideo: unitIntroVideo,
                url: url,
                moduleId: moduleId,
                key: key));

  static const String name = 'CourseUnitIntroVideoRoute';
}

class CourseUnitIntroVideoRouteArgs {
  const CourseUnitIntroVideoRouteArgs(
      {required this.unitTitle,
      required this.unitIntroVideo,
      required this.url,
      required this.moduleId,
      this.key});

  final String unitTitle;

  final UnitIntroVideo unitIntroVideo;

  final String url;

  final String moduleId;

  final Key? key;

  @override
  String toString() {
    return 'CourseUnitIntroVideoRouteArgs{unitTitle: $unitTitle, unitIntroVideo: $unitIntroVideo, url: $url, moduleId: $moduleId, key: $key}';
  }
}

/// generated route for
/// [MixedVideoPage]
class MixedVideoRoute extends PageRouteInfo<MixedVideoRouteArgs> {
  MixedVideoRoute(
      {required String unitTitle,
      required UnitMixedVideo unitMixedVideo,
      required String url,
      required String moduleId,
      Key? key})
      : super(MixedVideoRoute.name,
            path: '/mixed_video_page',
            args: MixedVideoRouteArgs(
                unitTitle: unitTitle,
                unitMixedVideo: unitMixedVideo,
                url: url,
                moduleId: moduleId,
                key: key));

  static const String name = 'MixedVideoRoute';
}

class MixedVideoRouteArgs {
  const MixedVideoRouteArgs(
      {required this.unitTitle,
      required this.unitMixedVideo,
      required this.url,
      required this.moduleId,
      this.key});

  final String unitTitle;

  final UnitMixedVideo unitMixedVideo;

  final String url;

  final String moduleId;

  final Key? key;

  @override
  String toString() {
    return 'MixedVideoRouteArgs{unitTitle: $unitTitle, unitMixedVideo: $unitMixedVideo, url: $url, moduleId: $moduleId, key: $key}';
  }
}

/// generated route for
/// [ReadingPage]
class ReadingRoute extends PageRouteInfo<ReadingRouteArgs> {
  ReadingRoute(
      {required Reading reading,
      required String unitTitle,
      required String moduleId,
      Key? key})
      : super(ReadingRoute.name,
            path: '/reading_page',
            args: ReadingRouteArgs(
                reading: reading,
                unitTitle: unitTitle,
                moduleId: moduleId,
                key: key));

  static const String name = 'ReadingRoute';
}

class ReadingRouteArgs {
  const ReadingRouteArgs(
      {required this.reading,
      required this.unitTitle,
      required this.moduleId,
      this.key});

  final Reading reading;

  final String unitTitle;

  final String moduleId;

  final Key? key;

  @override
  String toString() {
    return 'ReadingRouteArgs{reading: $reading, unitTitle: $unitTitle, moduleId: $moduleId, key: $key}';
  }
}

/// generated route for
/// [ModuleListenPage]
class ModuleListenRoute extends PageRouteInfo<ModuleListenRouteArgs> {
  ModuleListenRoute(
      {Key? key, CourseUnit? unitInfo, ListeningQuiz? listeningQuiz})
      : super(ModuleListenRoute.name,
            path: '/unit_module_listening',
            args: ModuleListenRouteArgs(
                key: key, unitInfo: unitInfo, listeningQuiz: listeningQuiz));

  static const String name = 'ModuleListenRoute';
}

class ModuleListenRouteArgs {
  const ModuleListenRouteArgs({this.key, this.unitInfo, this.listeningQuiz});

  final Key? key;

  final CourseUnit? unitInfo;

  final ListeningQuiz? listeningQuiz;

  @override
  String toString() {
    return 'ModuleListenRouteArgs{key: $key, unitInfo: $unitInfo, listeningQuiz: $listeningQuiz}';
  }
}

/// generated route for
/// [WritingVideoPage]
class WritingVideoRoute extends PageRouteInfo<WritingVideoRouteArgs> {
  WritingVideoRoute({required UnitWriting unitWriting, Key? key})
      : super(WritingVideoRoute.name,
            path: '/writing_video_page',
            args: WritingVideoRouteArgs(unitWriting: unitWriting, key: key));

  static const String name = 'WritingVideoRoute';
}

class WritingVideoRouteArgs {
  const WritingVideoRouteArgs({required this.unitWriting, this.key});

  final UnitWriting unitWriting;

  final Key? key;

  @override
  String toString() {
    return 'WritingVideoRouteArgs{unitWriting: $unitWriting, key: $key}';
  }
}

/// generated route for
/// [ConversationVideoPage]
class ConversationVideoRoute extends PageRouteInfo<ConversationVideoRouteArgs> {
  ConversationVideoRoute(
      {required String unitTitle,
      required UnitConversationVideo unitConversationVideo,
      required String url,
      required String moduleId,
      Key? key})
      : super(ConversationVideoRoute.name,
            path: '/conversation_video_page',
            args: ConversationVideoRouteArgs(
                unitTitle: unitTitle,
                unitConversationVideo: unitConversationVideo,
                url: url,
                moduleId: moduleId,
                key: key));

  static const String name = 'ConversationVideoRoute';
}

class ConversationVideoRouteArgs {
  const ConversationVideoRouteArgs(
      {required this.unitTitle,
      required this.unitConversationVideo,
      required this.url,
      required this.moduleId,
      this.key});

  final String unitTitle;

  final UnitConversationVideo unitConversationVideo;

  final String url;

  final String moduleId;

  final Key? key;

  @override
  String toString() {
    return 'ConversationVideoRouteArgs{unitTitle: $unitTitle, unitConversationVideo: $unitConversationVideo, url: $url, moduleId: $moduleId, key: $key}';
  }
}

/// generated route for
/// [ModuleProgressExamPage]
class ModuleProgressExamRoute extends PageRouteInfo<void> {
  const ModuleProgressExamRoute()
      : super(ModuleProgressExamRoute.name, path: '/unit_module_progressexam');

  static const String name = 'ModuleProgressExamRoute';
}

/// generated route for
/// [CoursePaymentPage]
class CoursePaymentRoute extends PageRouteInfo<CoursePaymentRouteArgs> {
  CoursePaymentRoute({Key? key, CourseInfo? courseInfo})
      : super(CoursePaymentRoute.name,
            path: '/payment',
            args: CoursePaymentRouteArgs(key: key, courseInfo: courseInfo));

  static const String name = 'CoursePaymentRoute';
}

class CoursePaymentRouteArgs {
  const CoursePaymentRouteArgs({this.key, this.courseInfo});

  final Key? key;

  final CourseInfo? courseInfo;

  @override
  String toString() {
    return 'CoursePaymentRouteArgs{key: $key, courseInfo: $courseInfo}';
  }
}

/// generated route for
/// [QpayPage]
class QpayRoute extends PageRouteInfo<QpayRouteArgs> {
  QpayRoute(
      {Key? key, CourseInfo? courseInfo, String? couponCode, String? price})
      : super(QpayRoute.name,
            path: '/qpay',
            args: QpayRouteArgs(
                key: key,
                courseInfo: courseInfo,
                couponCode: couponCode,
                price: price));

  static const String name = 'QpayRoute';
}

class QpayRouteArgs {
  const QpayRouteArgs({this.key, this.courseInfo, this.couponCode, this.price});

  final Key? key;

  final CourseInfo? courseInfo;

  final String? couponCode;

  final String? price;

  @override
  String toString() {
    return 'QpayRouteArgs{key: $key, courseInfo: $courseInfo, couponCode: $couponCode, price: $price}';
  }
}

/// generated route for
/// [VocabularyListPage]
class VocabularyListRoute extends PageRouteInfo<VocabularyListRouteArgs> {
  VocabularyListRoute(
      {required CourseUnit unit, required String unitTitle, Key? key})
      : super(VocabularyListRoute.name,
            path: '/vocabulary_list',
            args: VocabularyListRouteArgs(
                unit: unit, unitTitle: unitTitle, key: key));

  static const String name = 'VocabularyListRoute';
}

class VocabularyListRouteArgs {
  const VocabularyListRouteArgs(
      {required this.unit, required this.unitTitle, this.key});

  final CourseUnit unit;

  final String unitTitle;

  final Key? key;

  @override
  String toString() {
    return 'VocabularyListRouteArgs{unit: $unit, unitTitle: $unitTitle, key: $key}';
  }
}
