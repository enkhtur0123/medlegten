import 'package:freezed_annotation/freezed_annotation.dart';

part 'rep_state.freezed.dart';

///Extension Method for easy comparison
extension RepGetters on RepState {
  bool get isLoading => this is _RepStateLoading;
}

@freezed
abstract class RepState<T> with _$RepState {
  ///Initial
  const factory RepState.initial() = _ReptateInitial;

  ///Loading
  const factory RepState.loading() = _RepStateLoading;

  ///Data
  const factory RepState.data({required T data}) = _RepStateData;

  ///Error
  const factory RepState.error([String? error]) = _RepStateError;
}
