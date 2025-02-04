// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_job/constants/job_relationship_type.dart';

void main() {
  group("Job relationship type:", () {
    test("there are 2 job types", () {
      expect(JobRelationshipType.values.length, 2);
    });

    test("supervisor is a job relationship type", () {
      assert(JobRelationshipType.supervisor is JobRelationshipType);
    });

     test("coworker is a job relationship type", () {
      assert(JobRelationshipType.coworker is JobRelationshipType);
    });
  });
}
