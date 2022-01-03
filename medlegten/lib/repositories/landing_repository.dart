import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:medlegten/models/Landing/course_info.dart';
import 'package:medlegten/models/Landing/course_unit.dart';
import 'package:medlegten/repositories/rep_state.dart';
import 'package:medlegten/repositories/repository.dart';

final landingNotifierProvider =
    StateNotifierProvider<LandingRepositoryNotifier, RepState>(
  (ref) => LandingRepositoryNotifier(
    landingRepository: ref.watch(_landingRepositoryProvider),
  ),
);

//* Repository
final _landingRepositoryProvider = Provider<ILandingRepository>(
  (ref) => LandingRepository(),
);

class LandingRepositoryNotifier extends StateNotifier<RepState> {
  LandingRepositoryNotifier({
    required ILandingRepository landingRepository,
  })  : _landingRepository = landingRepository,
        super(const RepState.loading());

  final ILandingRepository _landingRepository;

  Future<void> getCourseList() async {
    try {
      final version = await _landingRepository.getCourseList();
      if (version != null) {
        state = RepState.data(data: version);
      } else {
        state = const RepState.error('Error');
      }
    } catch (_) {
      state = const RepState.error('Error');
    }
  }

  Future<void> getCourseUnitList(String courseId) async {
    try {
      final dataInfo = await _landingRepository.getCourseUnitList(courseId);
      if (dataInfo != null) {
        state = RepState.data(data: dataInfo);
      } else {
        state = const RepState.error('Error');
      }
    } catch (_) {
      state = const RepState.error('Error');
    }
  }
}

abstract class ILandingRepository {
  Future<List<CourseInfo>?> getCourseList();
  Future<List<CourseUnit>?> getCourseUnitList(String courseId);
}

class LandingRepository implements ILandingRepository {
  @override
  Future<List<CourseInfo>?> getCourseList() async {
    try {
      final response = await dioRepository.instance.get('Course');
      final res = json.decode('$response');
      if (res['isSuccess']) {
        var list = res['courseList'] as List;
        return list.map((i) => CourseInfo.fromJson(i)).toList();
      } else {
        dioRepository.snackBar(res['resultMessage']);
        return null;
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }

  @override
  Future<List<CourseUnit>?> getCourseUnitList(String courseId) async {
    try {
      final response =
          await dioRepository.instance.get('Course/Unit/$courseId');
      final res = json.decode('$response');
      if (res['isSuccess']) {
        var list = res['courseUnitList'] as List;
        return list.map((i) => CourseUnit.fromJson(i)).toList();
      } else {
        dioRepository.snackBar(res['resultMessage']);
        return null;
      }
    } catch (e) {
      dioRepository.snackBar(e.toString().toUpperCase());
      return null;
    }
  }
}
