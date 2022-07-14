import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_service.freezed.dart';
part 'active_service.g.dart';

@freezed
class ActiveService with _$ActiveService {
  factory ActiveService(String productId, String productName, String expireDate,
      String paymentType) = _ActiveService;

  factory ActiveService.fromJson(Map<String, dynamic> json) =>
      _$ActiveServiceFromJson(json);
}
