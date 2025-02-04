import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

part 'data_source_dependencies_providers.g.dart';

@Riverpod(keepAlive: true)
DatabaseProvider database(DatabaseRef ref) {
  return DatabaseProvider();
}
