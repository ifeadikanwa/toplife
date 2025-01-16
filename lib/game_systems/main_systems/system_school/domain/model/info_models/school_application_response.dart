import 'package:equatable/equatable.dart';

class SchoolApplicationResponse extends Equatable {
  final int degreeID;
  final bool accepted;
  final String reason;
  final int schoolFeesPerSemesterAmount;
  final bool appliedForScholarship;
  final int scholarshipPercentage;

  const SchoolApplicationResponse(
      {required this.degreeID,
      required this.accepted,
      this.reason = "",
      this.schoolFeesPerSemesterAmount = 0,
      this.appliedForScholarship = false,
      this.scholarshipPercentage = 0});

  @override
  List<Object?> get props => [
        degreeID,
        accepted,
        reason,
        schoolFeesPerSemesterAmount,
        appliedForScholarship,
        scholarshipPercentage,
      ];
}
