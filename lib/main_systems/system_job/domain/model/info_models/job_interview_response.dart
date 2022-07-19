class JobInterviewResponse {
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
}
