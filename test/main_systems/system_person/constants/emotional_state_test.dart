import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/emotional_state.dart';

void main() {
  group("Emotional State:", () {
    test("normal presentation name is correct", () {
      expect(EmotionalState.normal.presentationName, "Normal");
    });

    test("sad presentation name is correct", () {
      expect(EmotionalState.sad.presentationName, "Sad");
    });

    test("happy presentation name is correct", () {
      expect(EmotionalState.happy.presentationName, "Happy");
    });

    test("angry presentation name is correct", () {
      expect(EmotionalState.angry.presentationName, "Angry");
    });

    test("stressed presentation name is correct", () {
      expect(EmotionalState.stressed.presentationName, "Stressed");
    });

    test("pain presentation name is correct", () {
      expect(EmotionalState.pain.presentationName, "Pain");
    });
  });
}
