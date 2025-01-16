import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class PersonGravePair extends Equatable {
  final Person person;
  final Grave grave;

  const PersonGravePair({
    required this.person,
    required this.grave,
  });

  @override
  List<Object?> get props => [
        person,
        grave,
      ];
}
