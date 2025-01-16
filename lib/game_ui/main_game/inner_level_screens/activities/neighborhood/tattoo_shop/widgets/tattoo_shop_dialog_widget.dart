import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/button/default_elevated_button.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_ui/main_game/inner_level_screens/activities/neighborhood/tattoo_shop/constants/tattoo_shop_text_constants.dart';
import 'package:toplife/game_ui/main_game/inner_level_screens/activities/neighborhood/tattoo_shop/widgets/tattoo_shop_dialog_widget_view_model.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/tattoo/tattoo_body_location.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/tattoo/tattoo_shop.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/tattoo/tattoo_size.dart';

class TattooShopDialogWidget extends ConsumerStatefulWidget {
  const TattooShopDialogWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TattooShopDialogWidgetState();
}

class _TattooShopDialogWidgetState
    extends ConsumerState<TattooShopDialogWidget> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tattooShopDialogWidgetViewModelDataProvider =
        ref.watch(tattooShopDialogWidgetViewModelProvider);

    return tattooShopDialogWidgetViewModelDataProvider.when(
      data: (tattooShopDialogData) {
        return DialogContainer(
          title: const DialogTitleText(
            text: TattooShopTextConstants.tattooShop,
          ),
          children: [
            //
            //
            DescriptorRow(
              descriptor: "${TextConstants.cost}:",
              value: tattooShopDialogData.chosenTattooPrice,
            ),
            const AddVerticalSpace(
              height: DialogConstants.defaultWidgetSpacing,
            ),
            DescriptorRow(
              descriptor: "${TextConstants.duration}:",
              value: tattooShopDialogData.tattooDuration,
            ),
            const AddVerticalSpace(
              height: DialogConstants.doubleDefaultWidgetSpacing,
            ),

            //
            //
            const DialogLabelText(
              text: TattooShopTextConstants.chooseTattooShop,
            ),
            DialogDropdown<TattooShop>(
              value: tattooShopDialogData.tattooShop,
              items: TattooShop.values
                  .map(
                    (tattooShop) => DropdownMenuItem<TattooShop>(
                      value: tattooShop,
                      child: Text(
                        tattooShop.presentationName,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  ref
                      .read(tattooShopDialogWidgetViewModelProvider.notifier)
                      .updateTattooDetail(tattooShop: value);
                }
              },
            ),
            const AddVerticalSpace(
              height: DialogConstants.defaultWidgetSpacing,
            ),

            //
            //
            const DialogLabelText(
              text: TattooShopTextConstants.chooseTattooLocation,
            ),
            DialogDropdown<TattooBodyLocation>(
              value: tattooShopDialogData.tattooBodyLocation,
              items: TattooBodyLocation.values
                  .map(
                    (tattooBodyLocation) =>
                        DropdownMenuItem<TattooBodyLocation>(
                      value: tattooBodyLocation,
                      child: Text(
                        tattooBodyLocation.presentationName,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  ref
                      .read(tattooShopDialogWidgetViewModelProvider.notifier)
                      .updateTattooDetail(tattooBodyLocation: value);
                }
              },
            ),
            const AddVerticalSpace(
              height: DialogConstants.defaultWidgetSpacing,
            ),

            //
            //
            const DialogLabelText(
              text: TattooShopTextConstants.chooseTattooSize,
            ),
            DialogDropdown<TattooSize>(
              value: tattooShopDialogData.tattooSize,
              items: TattooSize.values
                  .map(
                    (tattooSize) => DropdownMenuItem<TattooSize>(
                      value: tattooSize,
                      child: Text(
                        tattooSize.presentationName,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  ref
                      .read(tattooShopDialogWidgetViewModelProvider.notifier)
                      .updateTattooDetail(tattooSize: value);
                }
              },
            ),
            const AddVerticalSpace(
              height: DialogConstants.defaultWidgetSpacing,
            ),

            //
            //
            const DialogLabelText(
              text: TattooShopTextConstants.chooseTattoo,
            ),
            TextField(
              controller: textEditingController,
              maxLength: tattooShopDialogData.tattooDescriptionLength,
              decoration: const InputDecoration(
                hintText: TattooShopTextConstants.enterTattooDescription,
              ),
              style: DialogConstants.defaultBodyTextStyle,
            ),

            //
            //
            const AddVerticalSpace(
              height: DialogConstants.verticalDescriptionButtonSpacing,
            ),
            //button
            DefaultElevatedButton(
                onPressed: () async {
                  AutoRouter.of(context).popForced();

                  await ref
                      .read(tattooShopDialogWidgetViewModelProvider.notifier)
                      .getTattoo(
                        tattooDescription: textEditingController.text,
                      );
                },
                text: TextConstants.get),
          ],
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }
}
