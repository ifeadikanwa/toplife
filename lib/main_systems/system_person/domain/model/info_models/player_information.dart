import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';

class PlayerInformation extends Equatable {
  final String firstName;
  final String lastName;
  final String age;
  final String country;
  final Stats stats;
  final String jobTitles;

  const PlayerInformation({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.country,
    required this.stats,
    required this.jobTitles,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        age,
        country,
        stats,
        jobTitles,
      ];

  static const blankPlayerInformation = PlayerInformation(
    firstName: TextConstants.dash,
    lastName: TextConstants.dash,
    age: TextConstants.dash,
    country: TextConstants.dash,
    stats: Stats(
      id: 0,
      personId: 0,
      energy: 0,
      hunger: 0,
      wellbeing: 0,
      health: 0,
      sober: 0,
      looks: 0,
      athleticism: 0,
      intellect: 0,
    ),
    jobTitles: TextConstants.emptyString,
  );

  PlayerInformation copyWith({
    String? firstName,
    String? lastName,
    String? age,
    String? country,
    Stats? stats,
    String? jobTitles,
  }) {
    return PlayerInformation(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      country: country ?? this.country,
      stats: stats ?? this.stats,
      jobTitles: jobTitles ?? this.jobTitles,
    );
  }
}
