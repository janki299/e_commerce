import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TcircularContainer extends StatelessWidget {
  const TcircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.child,
    this.padding,
    this.radius = 400,
    this.backgroundColor = TColors.lightContainer,
    this.margin,
    this.borderColor = Colors.transparent,
    this.randomHeight = false,
  });
  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsets? padding;
  final double radius;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final Color? borderColor;
  final bool randomHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor),
      child: child,
    );
  }
}

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.child,
    this.padding,
    this.radius = 400,
    this.backgroundColor = TColors.lightContainer,
    this.margin,
    this.borderColor = Colors.transparent,
    this.randomHeight = false,
    this.width,
    this.height,
  });

  final Widget? child;
  final EdgeInsets? padding;
  final double radius;
  final Color? backgroundColor;
  final EdgeInsets? margin;
  final Color? borderColor;
  final bool randomHeight;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width,
          height: height,
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(radius),
              color: backgroundColor),
          child: child,
        ),
      ],
    );
  }
}
