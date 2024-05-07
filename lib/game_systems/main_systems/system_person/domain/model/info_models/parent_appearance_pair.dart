import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class ParentAppearancePair extends Equatable {
  final Appearance motherAppearance;
  final Appearance fatherAppearance;

  const ParentAppearancePair({
    required this.motherAppearance,
    required this.fatherAppearance,
  });

  @override
  List<Object?> get props => [
        motherAppearance,
        fatherAppearance,
      ];
}
