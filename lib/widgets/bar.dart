import 'package:bmi/constants/app_constants.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final double barWidth;
  final bool isLeftAxisAlignment;
  const Bar(
      {super.key, required this.barWidth, this.isLeftAxisAlignment = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isLeftAxisAlignment ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            borderRadius: isLeftAxisAlignment
                ? BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
            color: AppConstants.accentHexcolor,
          ),
        ),
      ],
    );
  }
}
