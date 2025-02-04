import 'package:equatable/equatable.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class PrecollegePersonPair extends Equatable {
  final Precollege precollege;
  final Person person;

  const PrecollegePersonPair({
    required this.precollege,
    required this.person,
  });

  @override
  List<Object?> get props => [
        precollege,
        person,
      ];
}
