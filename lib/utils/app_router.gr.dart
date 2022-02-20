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
          child: GrammarTablePage(args.unitGrammar,
              key: args.key,
              moduleId: args.moduleId,
              unitTitle: args.unitTitle,
              isCompleted: args.isCompleted));
    },
    CourseUnitIntroVideoRoute.name: (routeData) {
      final args = routeData.argsAs<CourseUnitIntroVideoRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CourseUnitIntroVideoPage(args.unitIntroVideo, args.url,
              key: args.key,
              moduleId: args.moduleId,
              unitTitle: args.unitTitle,
              isCompleted: args.isCompleted));
    },
    MixedVideoRoute.name: (routeData) {
      final args = routeData.argsAs<MixedVideoRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: MixedVideoPage(args.unitMixedVideo, args.url,
              key: args.key,
              moduleId: args.moduleId,
              unitTitle: args.unitTitle,
              isCompleted: args.isCompleted));
    },
    ReadingRoute.name: (routeData) {
      final args = routeData.argsAs<ReadingRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ReadingPage(args.reading,
              key: args.key,
              moduleId: args.moduleId,
              unitTitle: args.unitTitle,
              isCompleted: args.isCompleted));
    },
    ModuleListenRoute.name: (routeData) {
      final args = routeData.argsAs<ModuleListenRouteArgs>(
          orElse: () => const ModuleListenRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ModuleListenPage(
              key: args.key,
              unitInfo: args.unitInfo,
              listeningQuiz: args.listeningQuiz,
              moduleId: args.moduleId,
              isCompleted: args.isCompleted));
    },
    WritingVideoRoute.name: (routeData) {
      final args = routeData.argsAs<WritingVideoRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WritingVideoPage(args.unitWriting, args.unitTitle,
              key: args.key,
              moduleId: args.moduleId,
              isCompleted: args.isCompleted));
    },
    ConversationVideoRoute.name: (routeData) {
      final args = routeData.argsAs<ConversationVideoRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ConversationVideoPage(args.unitConversationVideo, args.url,
              key: args.key,
              moduleId: args.moduleId,
              unitTitle: args.unitTitle,
              isCompleted: args.isCompleted));
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
    },
    LevelVideoListRoute.name: (routeData) {
      final args = routeData.argsAs<LevelVideoListRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: LevelVideoListPage(
              key: args.key,
              levelId: args.levelId,
              categoryName: args.categoryName));
    },
    VideoDetailRoute.name: (routeData) {
      final args = routeData.argsAs<VideoDetailRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: VideoDetailPage(args.url,
              key: args.key,
              movies: args.movies,
              title: args.title,
              isSerial: args.isSerial,
              serialChange: args.serialChange));
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
        RouteConfig(VocabularyListRoute.name, path: '/vocabulary_list'),
        RouteConfig(LevelVideoListRoute.name, path: '/level/event/list'),
        RouteConfig(VideoDetailRoute.name, path: '/video/detail')
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
      Key? key,
      String? moduleId,
      String? unitTitle,
      bool? isCompleted})
      : super(GrammarTableRoute.name,
            path: '/grammar_page',
            args: GrammarTableRouteArgs(
                unitGrammar: unitGrammar,
                key: key,
                moduleId: moduleId,
                unitTitle: unitTitle,
                isCompleted: isCompleted));

  static const String name = 'GrammarTableRoute';
}

class GrammarTableRouteArgs {
  const GrammarTableRouteArgs(
      {required this.unitGrammar,
      this.key,
      this.moduleId,
      this.unitTitle,
      this.isCompleted});

  final UnitGrammar unitGrammar;

  final Key? key;

  final String? moduleId;

  final String? unitTitle;

  final bool? isCompleted;

  @override
  String toString() {
    return 'GrammarTableRouteArgs{unitGrammar: $unitGrammar, key: $key, moduleId: $moduleId, unitTitle: $unitTitle, isCompleted: $isCompleted}';
  }
}

/// generated route for
/// [CourseUnitIntroVideoPage]
class CourseUnitIntroVideoRoute
    extends PageRouteInfo<CourseUnitIntroVideoRouteArgs> {
  CourseUnitIntroVideoRoute(
      {required UnitIntroVideo unitIntroVideo,
      required String url,
      Key? key,
      String? moduleId,
      String? unitTitle,
      bool? isCompleted})
      : super(CourseUnitIntroVideoRoute.name,
            path: '/intro_video_page',
            args: CourseUnitIntroVideoRouteArgs(
                unitIntroVideo: unitIntroVideo,
                url: url,
                key: key,
                moduleId: moduleId,
                unitTitle: unitTitle,
                isCompleted: isCompleted));

  static const String name = 'CourseUnitIntroVideoRoute';
}

class CourseUnitIntroVideoRouteArgs {
  const CourseUnitIntroVideoRouteArgs(
      {required this.unitIntroVideo,
      required this.url,
      this.key,
      this.moduleId,
      this.unitTitle,
      this.isCompleted});

  final UnitIntroVideo unitIntroVideo;

  final String url;

  final Key? key;

  final String? moduleId;

  final String? unitTitle;

  final bool? isCompleted;

  @override
  String toString() {
    return 'CourseUnitIntroVideoRouteArgs{unitIntroVideo: $unitIntroVideo, url: $url, key: $key, moduleId: $moduleId, unitTitle: $unitTitle, isCompleted: $isCompleted}';
  }
}

/// generated route for
/// [MixedVideoPage]
class MixedVideoRoute extends PageRouteInfo<MixedVideoRouteArgs> {
  MixedVideoRoute(
      {required UnitMixedVideo unitMixedVideo,
      required String url,
      Key? key,
      String? moduleId,
      String? unitTitle,
      bool? isCompleted})
      : super(MixedVideoRoute.name,
            path: '/mixed_video_page',
            args: MixedVideoRouteArgs(
                unitMixedVideo: unitMixedVideo,
                url: url,
                key: key,
                moduleId: moduleId,
                unitTitle: unitTitle,
                isCompleted: isCompleted));

  static const String name = 'MixedVideoRoute';
}

class MixedVideoRouteArgs {
  const MixedVideoRouteArgs(
      {required this.unitMixedVideo,
      required this.url,
      this.key,
      this.moduleId,
      this.unitTitle,
      this.isCompleted});

  final UnitMixedVideo unitMixedVideo;

  final String url;

  final Key? key;

  final String? moduleId;

  final String? unitTitle;

  final bool? isCompleted;

  @override
  String toString() {
    return 'MixedVideoRouteArgs{unitMixedVideo: $unitMixedVideo, url: $url, key: $key, moduleId: $moduleId, unitTitle: $unitTitle, isCompleted: $isCompleted}';
  }
}

/// generated route for
/// [ReadingPage]
class ReadingRoute extends PageRouteInfo<ReadingRouteArgs> {
  ReadingRoute(
      {required Reading reading,
      Key? key,
      String? moduleId,
      String? unitTitle,
      bool? isCompleted})
      : super(ReadingRoute.name,
            path: '/reading_page',
            args: ReadingRouteArgs(
                reading: reading,
                key: key,
                moduleId: moduleId,
                unitTitle: unitTitle,
                isCompleted: isCompleted));

  static const String name = 'ReadingRoute';
}

class ReadingRouteArgs {
  const ReadingRouteArgs(
      {required this.reading,
      this.key,
      this.moduleId,
      this.unitTitle,
      this.isCompleted});

  final Reading reading;

  final Key? key;

  final String? moduleId;

  final String? unitTitle;

  final bool? isCompleted;

  @override
  String toString() {
    return 'ReadingRouteArgs{reading: $reading, key: $key, moduleId: $moduleId, unitTitle: $unitTitle, isCompleted: $isCompleted}';
  }
}

/// generated route for
/// [ModuleListenPage]
class ModuleListenRoute extends PageRouteInfo<ModuleListenRouteArgs> {
  ModuleListenRoute(
      {Key? key,
      CourseUnit? unitInfo,
      ListeningQuiz? listeningQuiz,
      String? moduleId,
      bool? isCompleted})
      : super(ModuleListenRoute.name,
            path: '/unit_module_listening',
            args: ModuleListenRouteArgs(
                key: key,
                unitInfo: unitInfo,
                listeningQuiz: listeningQuiz,
                moduleId: moduleId,
                isCompleted: isCompleted));

  static const String name = 'ModuleListenRoute';
}

class ModuleListenRouteArgs {
  const ModuleListenRouteArgs(
      {this.key,
      this.unitInfo,
      this.listeningQuiz,
      this.moduleId,
      this.isCompleted});

  final Key? key;

  final CourseUnit? unitInfo;

  final ListeningQuiz? listeningQuiz;

  final String? moduleId;

  final bool? isCompleted;

  @override
  String toString() {
    return 'ModuleListenRouteArgs{key: $key, unitInfo: $unitInfo, listeningQuiz: $listeningQuiz, moduleId: $moduleId, isCompleted: $isCompleted}';
  }
}

/// generated route for
/// [WritingVideoPage]
class WritingVideoRoute extends PageRouteInfo<WritingVideoRouteArgs> {
  WritingVideoRoute(
      {required UnitWriting unitWriting,
      required String unitTitle,
      Key? key,
      String? moduleId,
      bool? isCompleted})
      : super(WritingVideoRoute.name,
            path: '/writing_video_page',
            args: WritingVideoRouteArgs(
                unitWriting: unitWriting,
                unitTitle: unitTitle,
                key: key,
                moduleId: moduleId,
                isCompleted: isCompleted));

  static const String name = 'WritingVideoRoute';
}

class WritingVideoRouteArgs {
  const WritingVideoRouteArgs(
      {required this.unitWriting,
      required this.unitTitle,
      this.key,
      this.moduleId,
      this.isCompleted});

  final UnitWriting unitWriting;

  final String unitTitle;

  final Key? key;

  final String? moduleId;

  final bool? isCompleted;

  @override
  String toString() {
    return 'WritingVideoRouteArgs{unitWriting: $unitWriting, unitTitle: $unitTitle, key: $key, moduleId: $moduleId, isCompleted: $isCompleted}';
  }
}

/// generated route for
/// [ConversationVideoPage]
class ConversationVideoRoute extends PageRouteInfo<ConversationVideoRouteArgs> {
  ConversationVideoRoute(
      {required UnitConversationVideo unitConversationVideo,
      required String url,
      Key? key,
      String? moduleId,
      String? unitTitle,
      bool? isCompleted})
      : super(ConversationVideoRoute.name,
            path: '/conversation_video_page',
            args: ConversationVideoRouteArgs(
                unitConversationVideo: unitConversationVideo,
                url: url,
                key: key,
                moduleId: moduleId,
                unitTitle: unitTitle,
                isCompleted: isCompleted));

  static const String name = 'ConversationVideoRoute';
}

class ConversationVideoRouteArgs {
  const ConversationVideoRouteArgs(
      {required this.unitConversationVideo,
      required this.url,
      this.key,
      this.moduleId,
      this.unitTitle,
      this.isCompleted});

  final UnitConversationVideo unitConversationVideo;

  final String url;

  final Key? key;

  final String? moduleId;

  final String? unitTitle;

  final bool? isCompleted;

  @override
  String toString() {
    return 'ConversationVideoRouteArgs{unitConversationVideo: $unitConversationVideo, url: $url, key: $key, moduleId: $moduleId, unitTitle: $unitTitle, isCompleted: $isCompleted}';
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

/// generated route for
/// [LevelVideoListPage]
class LevelVideoListRoute extends PageRouteInfo<LevelVideoListRouteArgs> {
  LevelVideoListRoute(
      {Key? key, String? levelId, required String? categoryName})
      : super(LevelVideoListRoute.name,
            path: '/level/event/list',
            args: LevelVideoListRouteArgs(
                key: key, levelId: levelId, categoryName: categoryName));

  static const String name = 'LevelVideoListRoute';
}

class LevelVideoListRouteArgs {
  const LevelVideoListRouteArgs(
      {this.key, this.levelId, required this.categoryName});

  final Key? key;

  final String? levelId;

  final String? categoryName;

  @override
  String toString() {
    return 'LevelVideoListRouteArgs{key: $key, levelId: $levelId, categoryName: $categoryName}';
  }
}

/// generated route for
/// [VideoDetailPage]
class VideoDetailRoute extends PageRouteInfo<VideoDetailRouteArgs> {
  VideoDetailRoute(
      {required String url,
      Key? key,
      List<Movie>? movies,
      String? title,
      bool? isSerial,
      dynamic Function(int)? serialChange})
      : super(VideoDetailRoute.name,
            path: '/video/detail',
            args: VideoDetailRouteArgs(
                url: url,
                key: key,
                movies: movies,
                title: title,
                isSerial: isSerial,
                serialChange: serialChange));

  static const String name = 'VideoDetailRoute';
}

class VideoDetailRouteArgs {
  const VideoDetailRouteArgs(
      {required this.url,
      this.key,
      this.movies,
      this.title,
      this.isSerial,
      this.serialChange});

  final String url;

  final Key? key;

  final List<Movie>? movies;

  final String? title;

  final bool? isSerial;

  final dynamic Function(int)? serialChange;

  @override
  String toString() {
    return 'VideoDetailRouteArgs{url: $url, key: $key, movies: $movies, title: $title, isSerial: $isSerial, serialChange: $serialChange}';
  }
}
