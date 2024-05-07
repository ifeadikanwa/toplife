import 'package:equatable/equatable.dart';

class PersonIdPair extends Equatable {
  final int firstId;
  final int secondId;

  const PersonIdPair({
    required this.firstId,
    required this.secondId,
  });

  @override
  List<Object?> get props => [
        firstId,
        secondId,
      ];
}
