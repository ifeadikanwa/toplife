import 'package:equatable/equatable.dart';
import 'package:toplife/core/text_constants.dart';

class PlayerBarInfo extends Equatable {
  final String firstName;
  final String lastName;
  final String currency;
  final String bankBalance;
  final String time;
  final String day;

  const PlayerBarInfo({
    required this.firstName,
    required this.lastName,
    required this.currency,
    required this.bankBalance,
    required this.time,
    required this.day,
  });

  static const blankPlayerBarInfo = PlayerBarInfo(
    firstName: TextConstants.emptyString,
    lastName: TextConstants.emptyString,
    currency: TextConstants.emptyString,
    bankBalance: TextConstants.emptyString,
    time: TextConstants.emptyString,
    day: TextConstants.emptyString,
  );

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        currency,
        bankBalance,
        time,
        day,
      ];

  @override
  bool? get stringify => true;
}
