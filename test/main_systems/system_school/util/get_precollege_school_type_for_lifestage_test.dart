import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/game_systems/main_systems/system_school/util/get_precollege_school_type_for_lifestage.dart';

void main() {
  group("getPrecollegeSchoolTypeForLifeStage: ", () {
    test("every lifestage returns the correct precollege school type", () {
      for (var lifestage in LifeStage.values) {
        final SchoolType? result = getPrecollegeSchoolTypeForLifeStage(
          lifeStage: lifestage,
        );

        switch (lifestage) {
          case LifeStage.baby:
            expect(result, null);
          case LifeStage.toddler:
            expect(result, SchoolType.elementarySchool);

          case LifeStage.child:
            expect(result, SchoolType.middleSchool);

          case LifeStage.teen:
            expect(result, SchoolType.highSchool);

          case LifeStage.youngAdult:
            expect(result, null);

          case LifeStage.adult:
            expect(result, null);

          case LifeStage.elder:
            expect(result, null);
        }
      }
    });
  });
}
