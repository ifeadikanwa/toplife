import 'package:equatable/equatable.dart';

class JobInterviewResponse extends Equatable {
  final bool accepted;
  final String reason;
  final bool qualifiedByEmployment;
  final bool qualifiedByDegree;
  final int jobLevel;

  const JobInterviewResponse({
    required this.accepted,
    this.reason = "",
    this.qualifiedByEmployment = false,
    this.qualifiedByDegree = false,
    this.jobLevel = 1,
  });

  @override
  List<Object?> get props => [
        accepted,
        reason,
        qualifiedByEmployment,
        qualifiedByDegree,
        jobLevel,
      ];

  @override
  bool? get stringify => true;
}
