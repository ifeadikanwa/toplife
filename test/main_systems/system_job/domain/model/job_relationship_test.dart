import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_job/domain/model/job_relationship.dart';

void main() {
  late JobRelationship sut;

  setUp(() {
    sut = const JobRelationship(
      id: 1,
      jobID: 3,
      mainPersonID: 6,
      otherPersonID: 9,
      jobRelationshipType: "coworker",
      informalRelationshipType: "friend",
      jobLevel: 2,
    );
  });

  group(
    "JobRelationship:",
    () {
      test("toMap returns map equivalent of object", () {
        final Map<String, Object?> correctMap = {
          "_id": 1,
          "jobID": 3,
          "mainPersonID": 6,
          "otherPersonID": 9,
          "jobRelationshipType": "coworker",
          "informalRelationshipType": "friend",
          "jobLevel": 2,
        };

        expect(sut.toMap(), correctMap);
      });

      test("fromMap returns job relationship object equivalent of map ", () {
        final Map<String, Object?> map = {
          "_id": 1,
          "jobID": 3,
          "mainPersonID": 6,
          "otherPersonID": 9,
          "jobRelationshipType": "coworker",
          "informalRelationshipType": "friend",
          "jobLevel": 2,
        };

        final result = JobRelationship.fromMap(jobRelationshipMap: map);

        expect(result, sut);
      });

      test("copyWith creates new object with correct values", () {
        const correctJobRelationship = JobRelationship(
          id: 1,
          jobID: 3,
          mainPersonID: 6,
          otherPersonID: 9,
          jobRelationshipType: "coworker",
          informalRelationshipType: "partner",
          jobLevel: 2,
        );
        final result = sut.copyWith(informalRelationshipType: "partner");
        expect(result, correctJobRelationship);
      });

      group("Constants:", () {
        test("id column should be defined as _id", () {
          expect(JobRelationship.idColumn, "_id");
        });
      });
    },
  );
}
