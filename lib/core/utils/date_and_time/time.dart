import 'package:equatable/equatable.dart';

class Time extends Equatable{
  final int hours;
  final int minutes;

  const Time({
    required this.hours,
    required this.minutes,
  });

  static const int minutesInAnHour = 60;
  static const int minutesInADay = 1440;
  static const int hoursInADay = 24;
  
  @override
  List<Object?> get props => [hours, minutes];

  @override
  bool? get stringify => true;
}
