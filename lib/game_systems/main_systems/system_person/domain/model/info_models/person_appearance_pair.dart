import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class PersonAppearancePair extends Equatable {
  final Person person;
  final Appearance appearance;

  const PersonAppearancePair({
    required this.person,
    required this.appearance,
  });

  @override
  List<Object?> get props => [
        person,
        appearance,
      ];
}
