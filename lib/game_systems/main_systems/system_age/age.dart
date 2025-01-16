import 'package:equatable/equatable.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';

class Age extends Equatable {
  final LifeStage lifeStage;
  final int pointInStage;

  const Age({
    required this.lifeStage,
    required this.pointInStage,
  });

  @override
  List<Object?> get props => [
        lifeStage,
        pointInStage,
      ];

  @override
  bool? get stringify => true;
}
