import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/button/default_elevated_button.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_ui/main_game/inner_level_screens/activities/neighborhood/piercing_shop/constants/piercing_shop_text_constants.dart';
import 'package:toplife/game_ui/main_game/inner_level_screens/activities/neighborhood/piercing_shop/widgets/piercing_shop_dialog_widget_view_model.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/piercing/piercing_body_location.dart';

class PiercingShopDialogWidget extends ConsumerWidget {
  const PiercingShopDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final piercingShopDialogWidgetViewModelDataProvider =
        ref.watch(piercingShopDialogWidgetViewModelProvider);

    //
    return piercingShopDialogWidgetViewModelDataProvider.when(
      data: (piercingShopDialogData) {
        return piercingShopDialogData == null
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DialogBodyText(
                      text: PiercingShopTextConstants.noAvailableLocation),
                ],
              )
            : DialogContainer(
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
                    value: piercingShopDialogData.chosenPiercingLocationPrice,
                  ),
                  const AddVerticalSpace(
                    height: DialogConstants.defaultWidgetSpacing,
                  ),

                  //
                  //
                  DescriptorRow(
                    descriptor: "${TextConstants.duration}:",
                    value: piercingShopDialogData.piercingDuration,
                  ),
                  const AddVerticalSpace(
                    height: DialogConstants.doubleDefaultWidgetSpacing,
                  ),

                  //
                  //
                  const DialogLabelText(
                    text: PiercingShopTextConstants.choosPiercingLocation,
                  ),
                  //
                  Column(
                    children: [
                      //
                      //drop dowm
                      DialogDropdown<PiercingBodyLocation>(
                        value: piercingShopDialogData.chosenPiercingLocation,
                        items: piercingShopDialogData.availablePiercingLocations
                            .map((location) =>
                                DropdownMenuItem<PiercingBodyLocation>(
                                    value: location,
                                    child: DialogBodyText(
                                      text: location.presentationName,
                                    )))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            ref
                                .read(piercingShopDialogWidgetViewModelProvider
                                    .notifier)
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
                      DefaultElevatedButton(
                        onPressed: () async {
                          AutoRouter.of(context).popForced();

                          await ref
                              .read(piercingShopDialogWidgetViewModelProvider
                                  .notifier)
                              .getPiercing();
                        },
                        text: TextConstants.get,
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
