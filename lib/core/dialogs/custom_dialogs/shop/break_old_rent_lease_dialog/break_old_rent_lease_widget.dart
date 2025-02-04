import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_widgets/button/default_elevated_button.dart';
import 'package:toplife/core/common_widgets/spaces/add_vertical_space.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_body_text.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_constants.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_container.dart';
import 'package:toplife/core/dialogs/dialog_helpers/dialog_title_text.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';

class BreakOldRentLeaseWidget extends ConsumerWidget {
  final House house;

  const BreakOldRentLeaseWidget({
    super.key,
    required this.house,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DialogContainer(
      title: const DialogTitleText(text: ShopResultConstants.breakLeaseTitle),
      children: [
        const DialogBodyText(
          text: ShopResultConstants.breakLeaseDescription,
          style: DialogConstants.defaultBodyTextStyle,
        ),
        const AddVerticalSpace(
            height: DialogConstants.verticalDescriptionButtonSpacing),
        DefaultElevatedButton(
          onPressed: () {
            AutoRouter.of(context).popForced<bool>(true);
          },
          text: ShopResultConstants.breakLeaseOption,
        ),
        const AddVerticalSpace(
          height: DialogConstants.verticalChoiceButtonSpacing,
        ),
        DefaultElevatedButton(
          onPressed: () {
            AutoRouter.of(context).popForced<bool>(false);
          },
          text: ShopResultConstants.nevermindOption,
        ),
      ],
    );
  }
}
