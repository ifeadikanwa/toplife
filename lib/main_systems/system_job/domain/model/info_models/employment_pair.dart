import 'package:equatable/equatable.dart';

class EmploymentPair<A, B> extends Equatable {
  final A employment;
  final B job;

  const EmploymentPair({required this.employment, required this.job});

  @override
  List<Object?> get props => [
        employment,
        job,
      ];
}
