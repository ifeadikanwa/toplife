import 'package:flutter/material.dart';
import 'package:toplife/config/theme/colors.dart';

class ProgressBar extends StatelessWidget {
  final int progressValue;
  final double minHeight;
  const ProgressBar({
    Key? key,
    required this.progressValue,
    this.minHeight = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
          border: Border.all(
        width: 0.5,
        color: Colors.black,
      )),
      child: Stack(
        children: [
          LinearProgressIndicator(
            value: progressValue / 100,
            backgroundColor: offWhite,
            color: Colors.green,
            minHeight: minHeight,
          ),
          Positioned(
            right: 1,
            bottom: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$progressValue",
                  style: TextStyle(fontSize: minHeight - 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
