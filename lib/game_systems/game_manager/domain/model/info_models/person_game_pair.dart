import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class PersonGamePair extends Equatable {
  final Person person;
  final Game game;

  const PersonGamePair({
    required this.person,
    required this.game,
  });

  @override
  List<Object?> get props => [person, game];

  @override
  bool? get stringify => true;
}
