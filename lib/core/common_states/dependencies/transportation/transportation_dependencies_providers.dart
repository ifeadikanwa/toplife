import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/transportation_usecases.dart';

final transportationUsecasesProvider = Provider<TransportationUsecases>((ref) {
  return TransportationUsecases(
    ref: ref,
  );
});
