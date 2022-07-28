import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/util/get_random_class_start_time.dart';

void main() {
  test("get random class time returns either 480, 540, 600, 660, 720", () {
    final int result = getRandomClassStartTime();

    expect(result, isIn([480, 540, 600, 660, 720]));
  });
}
