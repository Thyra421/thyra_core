import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSkeleton extends StatelessWidget {
  const ShimmerSkeleton({
    super.key,
    this.child,
    this.height,
    this.width,
    this.baseColor,
    this.highlightColor,
  }) : assert(
          child == null || (height == null && width == null),
          'Can not have both child and size properties',
        );

  final double? height;
  final double? width;
  final Widget? child;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: baseColor ?? Colors.grey.shade300,
        highlightColor: highlightColor ?? Colors.grey.shade200,
        child: child ??
            Container(
              height: height ?? 16,
              width: width ?? 64,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
      );
}
