import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_transportation/constants/transport_mode.dart';
import 'package:toplife/main_systems/system_transportation/constants/transportation_default.dart';
import 'package:toplife/main_systems/system_transportation/util/get_transport_mode_enum.dart';

class GetTransportModeUsecase {
  final PersonUsecases _personUsecases;
  const GetTransportModeUsecase(this._personUsecases);

  Future<TransportMode> execute({
    required int personID,
  }) async {
    //default
    const defaultTransportMode = TransportMode.bus;

    //get the person
    final Person? person =
        await _personUsecases.getPersonUsecase.execute(personID: personID);

    //get transport mode
    if (person != null) {
      final TransportMode transportMode =
          getTransportModeEnum(person.transportMode) ??
              TransportationDefault.transportMode;

      return transportMode;
    }

    //return default
    return defaultTransportMode;
  }
}
