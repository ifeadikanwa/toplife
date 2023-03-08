import 'package:equatable/equatable.dart';
import 'package:toplife/core/text_constants.dart';

class PlayerBarInfo extends Equatable {
  final String firstName;
  final String lastName;
  final String country;
  final String currency;
  final String bankBalance;
  final String time;
  final String day;

  const PlayerBarInfo({
    required this.firstName,
    required this.lastName,
    required this.country,
    required this.currency,
    required this.bankBalance,
    required this.time,
    required this.day,
  });

  static const blankPlayerBarInfo = PlayerBarInfo(
    firstName: TextConstants.dash,
    lastName: TextConstants.dash,
    country: TextConstants.dash,
    currency: TextConstants.dash,
    bankBalance: TextConstants.dash,
    time: TextConstants.dash,
    day: TextConstants.dash,
  );

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        country,
        currency,
        bankBalance,
        time,
        day,
      ];

  @override
  bool? get stringify => true;
}
