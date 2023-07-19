import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_dropdown_label_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/inner_level_screens/activities/neighborhood/tattoo_shop/constants/tattoo_shop_text_constants.dart';
import 'package:toplife/main_game/presentation/inner_level_screens/activities/neighborhood/tattoo_shop/widgets/tattoo_shop_dialog_widget_view_model.dart';
import 'package:toplife/main_game/presentation/top_level_screens/shop/widgets/dialogs/common/descriptor_row.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_body_location.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_shop.dart';
import 'package:toplife/main_systems/system_person/constants/tattoo/tattoo_size.dart';

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
    final TattooShopDialogWidgetViewModel tattooShopDialogWidgetViewModel =
        ref.watch(tattooShopDialogWidgetViewModelProvider.notifier);

    final tattooShopDialogWidgetViewModelDataProvider =
        ref.watch(tattooShopDialogWidgetViewModelProvider);

    return tattooShopDialogWidgetViewModelDataProvider.when(
      data: (tattooShopDetails) {
        return DialogContainer(
          title: const DialogTitleText(
            text: TattooShopTextConstants.tattooShop,
          ),
          children: [
            //
            //
            DescriptorRow(
              descriptor: "${TextConstants.cost}:",
              value: tattooShopDialogWidgetViewModel.getCost(),
            ),
            const AddVerticalSpace(
              height: DialogConstants.defaultWidgetSpacing,
            ),
            DescriptorRow(
              descriptor: "${TextConstants.duration}:",
              value: tattooShopDialogWidgetViewModel.getDuration(),
            ),
            const AddVerticalSpace(
              height: DialogConstants.doubleDefaultWidgetSpacing,
            ),

            //
            //
            const DialogDropdownLabelText(
              text: TattooShopTextConstants.chooseTattooShop,
            ),
            DialogDropdown<TattooShop>(
              value: tattooShopDetails.tattooShop,
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
                  tattooShopDialogWidgetViewModel.updateTattooShop(value);
                }
              },
            ),
            const AddVerticalSpace(
              height: DialogConstants.defaultWidgetSpacing,
            ),

            //
            //
            const DialogDropdownLabelText(
              text: TattooShopTextConstants.chooseTattooLocation,
            ),
            DialogDropdown<TattooBodyLocation>(
              value: tattooShopDetails.tattooBodyLocation,
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
                  tattooShopDialogWidgetViewModel
                      .updateTattooBodyLocation(value);
                }
              },
            ),
            const AddVerticalSpace(
              height: DialogConstants.defaultWidgetSpacing,
            ),

            //
            //
            const DialogDropdownLabelText(
              text: TattooShopTextConstants.chooseTattooSize,
            ),
            DialogDropdown<TattooSize>(
              value: tattooShopDetails.tattooSize,
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
                  tattooShopDialogWidgetViewModel.updateTattooSize(value);
                }
              },
            ),
            const AddVerticalSpace(
              height: DialogConstants.defaultWidgetSpacing,
            ),

            //
            //
            const DialogDropdownLabelText(
              text: TattooShopTextConstants.chooseTattoo,
            ),
            TextField(
              controller: textEditingController,
              maxLength:
                  tattooShopDialogWidgetViewModel.getTattooDescriptionLength(),
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
            ElevatedButton(
              onPressed: () async {
                AutoRouter.of(context).pop();

                await tattooShopDialogWidgetViewModel.getTattoo(
                  context: context,
                  tattooDescription: textEditingController.text,
                );
              },
              child: const Text(TextConstants.getUppercase),
            ),
          ],
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => Container(),
    );
  }
}
