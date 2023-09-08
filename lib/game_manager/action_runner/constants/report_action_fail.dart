//used in action result to ask the action runner to send a result dialog reporting cause of failure to the player
enum ReportActionFail {
  none(description: ""),
  lowStats(description: "It looks like you do not have enough stats to perform this action");

  const ReportActionFail({
    required this.description,
  });

  final String description;
}
