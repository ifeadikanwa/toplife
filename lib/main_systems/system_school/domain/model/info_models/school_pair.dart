import 'package:equatable/equatable.dart';

class SchoolPair<A, B> extends Equatable {
  final A school;
  final B degree;

  const SchoolPair({required this.school, required this.degree});

  @override
  List<Object?> get props => [
        school,
        degree,
      ];
}
