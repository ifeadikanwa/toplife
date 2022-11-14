// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EventChoice extends Equatable {
  final String choiceDescription;
  final Function(BuildContext context) choiceAction;

  EventChoice({
    required this.choiceDescription,
    required this.choiceAction,
  });

  @override
  List<Object?> get props => [
        choiceDescription,
        choiceAction,
      ];
}
