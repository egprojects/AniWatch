import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ThemedShimmer extends StatelessWidget {
  final Widget child;
  final double width, height;
  final Duration period;
  final ShimmerDirection direction;
  final int loop;
  final bool enabled;

  const ThemedShimmer({
    Key key,
    this.child,
    this.width,
    this.height,
    this.period = const Duration(seconds: 2),
    this.direction = ShimmerDirection.ltr,
    this.loop = 0,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Shimmer.fromColors(
      key: key,
      baseColor: theme.disabledColor,
      highlightColor: theme.highlightColor,
      child: child ??
          Container(
            width: width,
            height: height,
            color: theme.disabledColor,
          ),
      period: period,
      direction: direction,
      loop: loop,
      enabled: enabled,
    );
  }
}
