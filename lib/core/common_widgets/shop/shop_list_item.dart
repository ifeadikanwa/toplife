import 'package:flutter/material.dart';
import 'package:toplife/config/theme/colors.dart';

class ShopListItem extends StatelessWidget {
  const ShopListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: translucentWhite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              child: Image.asset(
                "assets/images/baby_food.jpg",
                height: 100,
                fit: BoxFit.fitHeight,
              ),
            ),
            // Text(
            //   "Simu Organic Baby Formula",
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //   ),
            //   softWrap: true,
            // ),
            // Text("\$150"),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     primary: brightPurple,
            //     onPrimary: Colors.white,
            //   ),
            //   onPressed: () {},
            //   child: Text("Buy"),
            // ),
          ],
        ),
      ),
    );
  }
}
