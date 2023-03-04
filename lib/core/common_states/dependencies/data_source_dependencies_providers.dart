import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final databaseProvider =
    Provider<DatabaseProvider>((ref) => DatabaseProvider());