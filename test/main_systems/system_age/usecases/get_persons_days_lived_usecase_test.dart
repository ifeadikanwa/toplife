import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_age/usecases/get_persons_days_lived_usecase.dart';

void main() {
  group("GetPersonsDaysLivedUsecase: ", () {
    const GetPersonsDaysLivedUsecase sut = GetPersonsDaysLivedUsecase();
    test(
      "returns correct value for calculation",
      () {
        const currentDay = 20;
        const dayOfBirth = -30;
        final result = sut.execute(
          currentDay: currentDay,
          dayOfBirth: dayOfBirth,
        );

        expect(
          result,
          currentDay - dayOfBirth,
        );
      },
    );
  });
}
