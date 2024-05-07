import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';

part 'quick_actions_section_view_model.g.dart';

@riverpod
class QuickActionsSectionViewModel extends _$QuickActionsSectionViewModel {
  @override
  void build() {}

  Future<void> quickEat() async {
    await ref.read(personUsecasesProvider).quickEatUsecase.perform();
  }
}
