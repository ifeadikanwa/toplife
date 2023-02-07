import 'package:equatable/equatable.dart';
import 'package:toplife/game_manager/domain/model/game.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

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
