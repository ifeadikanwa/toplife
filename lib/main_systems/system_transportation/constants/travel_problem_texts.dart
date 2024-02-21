import 'package:toplife/core/utils/words/sentence_pair.dart';
import 'package:toplife/main_systems/system_transportation/constants/transport_mode.dart';

class TravelProblemTexts {
  static const String title = "Road Travel Not Possible";

  static const iTriedToTravelByRoadBut = "I tried to travel by road but ";

  static const SentencePair noProblem = SentencePair(
    firstPersonSentence: "",
    secondPersonSentence: "",
  );

  static const SentencePair accident = SentencePair(
    firstPersonSentence: "I got into a road accident.",
    secondPersonSentence: "You got into a road accident.",
  );
  static const SentencePair differentCountries = SentencePair(
    firstPersonSentence:
        "the location I tried to get to was in another country.",
    secondPersonSentence:
        "The location you are trying to get to is in another country.",
  );

  static const SentencePair unknownReason = SentencePair(
    firstPersonSentence: "I couldn't.",
    secondPersonSentence: "Looks like you can't make the trip.",
  );

  static const SentencePair noFuel = SentencePair(
    firstPersonSentence: "I did not have enough fuel in my car.",
    secondPersonSentence: "There is currently not enough fuel in your car.",
  );

  static const SentencePair carProblem = SentencePair(
    firstPersonSentence:
        "my car was not starting. I should consider taking it to the mechanic.",
    secondPersonSentence:
        "Your car is not starting. You should consider taking it to the mechanic.",
  );

  static const SentencePair deadCar = SentencePair(
    firstPersonSentence:
        "my car has reached the end of its lifetime. I can no longer drive it.",
    secondPersonSentence:
        "Your car has reached the end of its lifetime. You can no longer drive it",
  );

  static SentencePair cantPayTransportFare(TransportMode transportMode) =>
      SentencePair(
        firstPersonSentence:
            "I did not have enough money for the ${transportMode.presentationName.toLowerCase()} fare. I should consider taking another mode of transport.",
        secondPersonSentence:
            "You currently don't have enough money for the ${transportMode.presentationName.toLowerCase()} fare. Consider taking another mode of transport.",
      );
}
