import 'package:toplife/main_systems/system_transportation/constants/transport_mode.dart';

class TravelProblemTexts {
  static const noProblem = "";
  static const unknownReason = "Looks like you can't make the trip";
  static const noFuel = "There is currently not enough fuel in your car";
  static const carProblem =
      "Your car is not starting. You should consider taking it to the mechanic";
  static const deadCar =
      "Your car has reached the end of its lifetime. You can no longer drive it";

  static String cantPayTransportFare(TransportMode transportMode) =>
      "You currently don't have enough money for the ${transportMode.presentationName.toLowerCase()} fare. Consider taking another mode of transport.";
}
