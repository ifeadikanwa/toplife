import 'package:toplife/main_systems/system_person/constants/gender.dart';

Gender getGenderEnumFromString(String gender){
   if (gender.toLowerCase() == Gender.Male.name.toLowerCase()) {
      return Gender.Male;
    } else {
     return Gender.Female;
    }
}