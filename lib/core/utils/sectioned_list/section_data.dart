import 'package:equatable/equatable.dart';

class SectionData<T> extends Equatable {
  final String title;
  final List<T> content;

  const SectionData({
    required this.title,
    required this.content,
  });

  @override
  List<Object?> get props => [
        title,
        content,
      ];
}
