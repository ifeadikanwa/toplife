import 'package:equatable/equatable.dart';

class DayAndMinutes extends Equatable {
  final int day;
  final int minutes;
  final bool isNewDay;

  const DayAndMinutes({
    required this.day,
    required this.minutes,
    required this.isNewDay,
  });
  
  @override
  List<Object?> get props => [day, minutes, isNewDay];

  @override
  bool? get stringify => true;
}
