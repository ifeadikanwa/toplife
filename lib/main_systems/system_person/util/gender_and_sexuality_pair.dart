import 'package:equatable/equatable.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';

class GenderAndSexualityPair extends Equatable {
  final Gender gender;
  final Sexuality sexuality;

  const GenderAndSexualityPair({
    required this.gender,
    required this.sexuality,
  });
  
  @override
  List<Object?> get props => [gender, sexuality];

  @override
  bool? get stringify => true;
}
