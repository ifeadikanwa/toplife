//used in action result to ask the action runner to send a result dialog after all the work has been done
import 'package:equatable/equatable.dart';

sealed class ReportType extends Equatable {}

//there is nothing to report
class NoReport implements ReportType {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

//set a dialog to report
class Report implements ReportType {
  final Future<void> dialog;

  const Report({required this.dialog});

  @override
  List<Object?> get props => [dialog];

  @override
  bool? get stringify => true;
}
