import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/constants/school_category.dart';

void main() {
  group("School Category:", () {
    test(
      "precollege presentation name is correct",
      () => expect(
        SchoolCategory.precollege.presentationName,
        "Pre-college",
      ),
    );

    test(
      "college presentation name is correct",
      () => expect(
        SchoolCategory.college.presentationName,
        "College",
      ),
    );
  });
}
