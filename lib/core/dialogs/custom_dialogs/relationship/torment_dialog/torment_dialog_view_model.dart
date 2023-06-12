import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/constants/torment_option.dart';

final tormentDialogViewModelProvider =
    StateNotifierProvider.autoDispose<TormentDialogViewModel, TormentOption>(
        (ref) => TormentDialogViewModel());

class TormentDialogViewModel extends StateNotifier<TormentOption> {
  TormentDialogViewModel() : super(TormentOption.insult);

  void updateTormentOption(TormentOption tormentOption) {
    state = tormentOption;
  }

  void executeTorment(){
    
  }
}
