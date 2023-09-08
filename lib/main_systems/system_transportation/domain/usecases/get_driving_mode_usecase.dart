import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_transportation/constants/driving_mode.dart';
import 'package:toplife/main_systems/system_transportation/constants/transportation_default.dart';
import 'package:toplife/main_systems/system_transportation/util/get_driving_mode_enum.dart';

class GetDrivingModeUsecase {
  final PersonUsecases _personUsecases;
  const GetDrivingModeUsecase(this._personUsecases);

  Future<DrivingMode> execute({
    required int personID,
  }) async {
    //default
    const defaultDrivingMode = DrivingMode.normal;

    //get the person
    final Person? person =
        await _personUsecases.getPersonUsecase.execute(personID: personID);

    //get driving mode
    if (person != null) {
      final DrivingMode drivingMode =
          getDrivingModeEnum(person.drivingMode) ??
              TransportationDefault.drivingMode;

      return drivingMode;
    }

    //return default
    return defaultDrivingMode;
  }
}
