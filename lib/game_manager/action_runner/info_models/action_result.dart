import 'package:equatable/equatable.dart';
import 'package:toplife/game_manager/action_runner/info_models/report.dart';

//Action result exists because we need a way to communicate to action runner whether to move time forward or not.
//For example: sometimes an action isn't completed because the player doesn't have enough money,
//this is the way we let action runner know that we didn't go through with the action.
//Another example: sometimes we decide in the action the amount of time something should take
//this is how we send that time back to the action runner
class ActionResult extends Equatable {
  final bool isSuccessful;
  final ReportType reportType;
  final int? durationInMinutes;
  final String? journalEntry;

  const ActionResult({
    required this.isSuccessful,
    required this.reportType,
    required this.durationInMinutes,
    required this.journalEntry,
  });

  //failed action, do nothing
  factory ActionResult.failedWithNoReportOrJournalEntry() => ActionResult(
        isSuccessful: false,
        reportType: NoReport(),
        durationInMinutes: null,
        journalEntry: null,
      );

  factory ActionResult.failedWithJournalEntryAndReport({
    required Report report,
    required String journalEntry,
  }) =>
      ActionResult(
        isSuccessful: false,
        reportType: report,
        durationInMinutes: null,
        journalEntry: journalEntry,
      );

  factory ActionResult.failedWithJournalEntry({
    required String journalEntry,
  }) =>
      ActionResult(
        isSuccessful: false,
        reportType: NoReport(),
        durationInMinutes: null,
        journalEntry: journalEntry,
      );

  //failed action, show report dialog
  factory ActionResult.failedWithReport({
    required Report report,
  }) =>
      ActionResult(
        isSuccessful: false,
        reportType: report,
        durationInMinutes: null,
        journalEntry: null,
      );

  //successful action with no report or extra duration
  factory ActionResult.successWithNoReportJournalEntryOrDuration() =>
      ActionResult(
        isSuccessful: true,
        reportType: NoReport(),
        durationInMinutes: null,
        journalEntry: null,
      );

  //successful with journal entry and no report or extra duration
  factory ActionResult.successWithJournalEntryButNoReportOrDuration({
    required String journalEntry,
  }) =>
      ActionResult(
        isSuccessful: true,
        reportType: NoReport(),
        durationInMinutes: null,
        journalEntry: journalEntry,
      );

  //successful with custom report and no extra duration
  factory ActionResult.successWithReportJournalEntryButNoDuration({
    required Report report,
    required String journalEntry,
  }) =>
      ActionResult(
        isSuccessful: true,
        reportType: report,
        durationInMinutes: null,
        journalEntry: journalEntry,
      );

  //successful with custom report and duration
  factory ActionResult.successWithReportJournalEntryAndDuration({
    required Report report,
    required String journalEntry,
    required int durationInMinutes,
  }) =>
      ActionResult(
        isSuccessful: true,
        reportType: report,
        durationInMinutes: durationInMinutes,
        journalEntry: journalEntry,
      );

  @override
  List<Object?> get props => [
        isSuccessful,
        reportType.runtimeType,
        //use runtime type to assume equality for our test
        durationInMinutes,
        journalEntry,
      ];
}
