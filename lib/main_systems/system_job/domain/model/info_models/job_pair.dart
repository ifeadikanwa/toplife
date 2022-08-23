import 'package:equatable/equatable.dart';

class JobPair<A, B> extends Equatable {
  final A employment;
  final B job;

  const JobPair({required this.employment, required this.job});

  @override
  List<Object?> get props => [
        employment,
        job,
      ];
}
