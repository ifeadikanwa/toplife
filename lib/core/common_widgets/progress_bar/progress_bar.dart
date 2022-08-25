import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/spaces/add_horizontal_space.dart';

class ProgressBar extends StatelessWidget {
  final int progressValue;
  final double minHeight;
  final bool showProgressValue;
  const ProgressBar({
    Key? key,
    required this.progressValue,
    this.minHeight = 10.0,
    this.showProgressValue = true,
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
            backgroundColor: Colors.grey.withOpacity(0.2),
            color: Colors.green,
            minHeight: minHeight,
          ),
          showProgressValue
              ? Positioned(
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
                )
              : const AddHorizontalSpace(width: 0),
        ],
      ),
    );
  }
}
