import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_time_reset.g.dart';

@Riverpod()
final class DateTimeReset extends _$DateTimeReset {
  @override
  bool build() => true;

  void changeResetValue() => state = !state;
}
