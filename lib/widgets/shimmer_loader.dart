import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  final bool showCircle;
  final int lines;
  final double circleSize;
  final double titleWidth;
  final EdgeInsetsGeometry padding;

  const ShimmerLoader({
    super.key,
    this.showCircle = true,
    this.lines = 5,
    this.circleSize = 75,
    this.titleWidth = 200,
    this.padding = const EdgeInsets.only(top: 30.0, left: 10, right: 10),
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            if (showCircle)
              Shimmer.fromColors(
                baseColor: Colors.grey.shade700,
                highlightColor: Colors.grey.shade500,
                child: CircleAvatar(
                  radius: circleSize,
                  backgroundColor: Colors.grey[700],
                ),
              ),
            if (showCircle) const SizedBox(height: 20),

            Shimmer.fromColors(
              baseColor: Colors.grey.shade700,
              highlightColor: Colors.grey.shade500,
              child: Container(
                height: 25,
                width: titleWidth,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 50),

            ...List.generate(lines, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade700,
                  highlightColor: Colors.grey.shade500,
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
