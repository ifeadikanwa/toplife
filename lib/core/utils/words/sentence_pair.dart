import 'package:equatable/equatable.dart';

class SentencePair extends Equatable {
  final String firstPersonSentence;
  final String secondPersonSentence;

  const SentencePair({
    required this.firstPersonSentence,
    required this.secondPersonSentence,
  });

  @override
  List<Object?> get props => [
        firstPersonSentence,
        secondPersonSentence,
      ];
}
