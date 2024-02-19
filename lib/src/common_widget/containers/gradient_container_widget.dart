import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    this.padding,
    this.width,
    this.height,
    this.boxShadow,
    this.beginColor = Colors.blue,
    this.middleColor,
    this.endColor = Colors.blueAccent,
    this.borderRadius,
    this.beginColorAlignment = Alignment.topCenter,
    this.endColorAlignment = Alignment.bottomCenter,
    this.child,
    this.onTap,
  });

  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color beginColor;
  final Color? middleColor;
  final Color endColor;
  final BorderRadiusGeometry? borderRadius;
  final Alignment beginColorAlignment;
  final Alignment endColorAlignment;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return boxShadow == null
        ? ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(0),
            child: Material(
              child: Ink(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  // borderRadius: borderRadius,
                  gradient: LinearGradient(
                    begin: beginColorAlignment,
                    end: endColorAlignment,
                    colors: middleColor == null
                        ? [beginColor, endColor]
                        : [beginColor, middleColor!, endColor],
                  ),
                ),
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    padding: padding,
                    width: width,
                    height: height,
                    child: child,
                  ),
                ),
              ),
            ),
          )
        : ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(0),
            child: Material(
              child: Ink(
                decoration: BoxDecoration(
                  boxShadow: boxShadow!,
                  // borderRadius: borderRadius,
                  gradient: LinearGradient(
                    begin: beginColorAlignment,
                    end: endColorAlignment,
                    colors: [beginColor, endColor],
                  ),
                ),
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    padding: padding,
                    width: width,
                    height: height,
                    child: child,
                  ),
                ),
              ),
            ),
          );
  }
}
