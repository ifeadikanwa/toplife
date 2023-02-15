// import 'package:flutter_test/flutter_test.dart';
// import 'package:toplife/core/data_source/drift_database/database_provider.dart';

// void main() {
//   late Stance sut;

//   setUp(() {
//     sut = const Stance(
//       id: 1,
//       personID: 3,
//       openToAdoption: false,
//       openToSexWorkerPartner: true,
//       openToAbortion: true,
//       openToSurrogacy: false,
//       openToAlternativeFertilityMethods: true,
//       openToSigningPrenup: true,
//       wantsPartnerToSignPrenup: false,
//       openToCrimes: true,
//       openToStayAtHomeParenting: false,
//       openToPremaritalSex: true,
//     );
//   });

//   group(
//     "Stance:",
//     () {
//       test("toMap returns map equivalent of object", () {
//         final Map<String, Object?> correctMap = {
//           "_id": 1,
//           "personID": 3,
//           "openToAdoption": 0,
//           "openToSexWorkerPartner": 1,
//           "openToAbortion": 1,
//           "openToSurrogacy": 0,
//           "openToAlternativeFertilityMethods": 1,
//           "openToSigningPrenup": 1,
//           "wantsPartnerToSignPrenup": 0,
//           "openToCrimes": 1,
//           "openToStayAtHomeParenting": 0,
//           "openToPremaritalSex": 1,
//         };

//         expect(sut.toMap(), correctMap);
//       });

//       test("fromMap returns stance object equivalent of map ", () {
//         final Map<String, Object?> map = {
//           "_id": 1,
//           "personID": 3,
//           "openToAdoption": 0,
//           "openToSexWorkerPartner": 1,
//           "openToAbortion": 1,
//           "openToSurrogacy": 0,
//           "openToAlternativeFertilityMethods": 1,
//           "openToSigningPrenup": 1,
//           "wantsPartnerToSignPrenup": 0,
//           "openToCrimes": 1,
//           "openToStayAtHomeParenting": 0,
//           "openToPremaritalSex": 1,
//         };

//         final result = Stance.fromMap(stanceMap: map);

//         expect(result, sut);
//       });

//       test("copyWith creates new object with correct values", () {
//         const correctStats = Stance(
//           id: 1,
//           personID: 3,
//           openToAdoption: true,
//           openToSexWorkerPartner: false,
//           openToAbortion: false,
//           openToSurrogacy: false,
//           openToAlternativeFertilityMethods: true,
//           openToSigningPrenup: true,
//           wantsPartnerToSignPrenup: false,
//           openToCrimes: true,
//           openToStayAtHomeParenting: false,
//           openToPremaritalSex: true,
//         );

//         final result = sut.copyWith(
//             openToAbortion: false,
//             openToAdoption: true,
//             openToSexWorkerPartner: false);

//         expect(result, correctStats);
//       });

//       test("getValidStanceValue returns true or false only", () {
//         final bool result = Stance.getValidStanceValue();
//         assert(result == true || result == false);
//       });

//       group("Constants:", () {
//         test("id column should be defined as _id", () {
//           expect(Stance.idColumn, "_id");
//         });
//       });
//     },
//   );
// }
