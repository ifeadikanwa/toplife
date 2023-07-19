import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/inner_level_screens/activities/neighborhood/piercing_shop/constants/piercing_shop_text_constants.dart';
import 'package:toplife/main_game/presentation/inner_level_screens/activities/neighborhood/piercing_shop/widgets/piercing_shop_dialog_widget_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/main_systems/system_person/constants/piercing/piercing_body_location.dart';

class PiercingShopDialogWidget extends ConsumerWidget {
  const PiercingShopDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PiercingShopDialogWidgetViewModel piercingShopDialogWidgetViewModel =
        ref.watch(piercingShopDialogWidgetViewModelProvider.notifier);

    final piercingShopDialogWidgetViewModelDataProvider =
        ref.watch(piercingShopDialogWidgetViewModelProvider);

    //
    return piercingShopDialogWidgetViewModelDataProvider.when(
      data: (chosenAndAvailablePiercingLocationsPair) {
        return DialogContainer(
          //
          //
          title: const DialogTitleText(
            text: PiercingShopTextConstants.piercingsShop,
          ),

          //
          //
          children: [
            //
            //
            DescriptorRow(
              descriptor: "${TextConstants.cost}:",
              value: piercingShopDialogWidgetViewModel.getCost(),
            ),
            const AddVerticalSpace(
              height: DialogConstants.defaultWidgetSpacing,
            ),

            //
            //
            DescriptorRow(
              descriptor: "${TextConstants.duration}:",
              value: piercingShopDialogWidgetViewModel.getDuration(),
            ),
            const AddVerticalSpace(
              height: DialogConstants.doubleDefaultWidgetSpacing,
            ),

            //
            //
            const DialogDropdownLabelText(
              text: PiercingShopTextConstants.choosPiercingLocation,
            ),
            //
            (chosenAndAvailablePiercingLocationsPair == null)
                ? const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DialogBodyText(
                          text: PiercingShopTextConstants.noAvailableLocation),
                    ],
                  )
                : Column(
                    children: [
                      //
                      //drop dowm
                      DialogDropdown<PiercingBodyLocation>(
                        value: chosenAndAvailablePiercingLocationsPair
                            .chosenPiercingLocation,
                        items: chosenAndAvailablePiercingLocationsPair
                            .availablePiercingLocations
                            .map((location) =>
                                DropdownMenuItem<PiercingBodyLocation>(
                                    value: location,
                                    child: DialogBodyText(
                                      text: location.presentationName,
                                    )))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            piercingShopDialogWidgetViewModel
                                .updateChosenLocation(value);
                          }
                        },
                      ),
                      const AddVerticalSpace(
                        height:
                            DialogConstants.verticalDescriptionButtonSpacing,
                      ),
                      //
                      //button
                      ElevatedButton(
                        onPressed: () async {
                          AutoRouter.of(context).pop();

                          await piercingShopDialogWidgetViewModel.getPiercing(
                            context: context,
                          );
                        },
                        child: const Text(TextConstants.getUppercase),
                      ),
                    ],
                  )
          ],
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }
}
