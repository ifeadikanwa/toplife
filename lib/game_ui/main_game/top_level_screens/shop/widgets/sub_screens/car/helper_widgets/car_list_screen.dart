import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/divider/list_divider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/show_dialog/show_dismissable_dialog.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/dialogs/car/buy_car_dialog/buy_car_dialog.dart';
import 'package:toplife/game_ui/main_game/top_level_screens/shop/widgets/helper_widgets/shop_list_item.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_car_speed_label.dart';

class CarListScreen extends StatelessWidget {
  final List<Car> carsList;

  const CarListScreen({super.key, required this.carsList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final Car car = carsList[index];
        return ShopListItem(
          itemName: car.name,
          itemDetails: getCarSpeedLabel(
            percentageTravel: car.percentageOfTravelTime,
          ),
          itemBasePrice: car.basePrice,
          itemImage: "",
          onTap: () => showDismissableDialog(
            context: context,
            child: BuyCarDialog(car: car),
          ),
        );
      },
      separatorBuilder: (context, index) => const ListDivider(),
      itemCount: carsList.length,
    );
  }
}
