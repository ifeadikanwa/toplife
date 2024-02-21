import 'package:equatable/equatable.dart';

class StringPair extends Equatable {
  final String first;
  final String second;

  const StringPair({
    required this.first,
    required this.second,
  });

  @override
  List<Object?> get props => [
        first,
        second,
      ];
}
