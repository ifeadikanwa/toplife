import 'package:equatable/equatable.dart';

class BasicParentInfo extends Equatable {
  final int parentId;
  final bool isBirthParent;

  const BasicParentInfo({
    required this.parentId,
    required this.isBirthParent,
  });

  @override
  List<Object?> get props => [
        parentId,
        isBirthParent,
      ];
}
