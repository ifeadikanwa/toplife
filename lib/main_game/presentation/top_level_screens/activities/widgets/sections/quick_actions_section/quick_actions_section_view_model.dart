import 'package:flutter_riverpod/flutter_riverpod.dart';

final quickActionsSectionViewModelProvider =
    Provider<QuickActionsSectionViewModel>((ref) => QuickActionsSectionViewModel());

//ViewModel
class QuickActionsSectionViewModel {
  //handles no state, we create functions that get called in onTap
}
