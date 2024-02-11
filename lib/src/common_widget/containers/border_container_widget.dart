import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    super.key,
    this.padding,
    this.width,
    this.height,
    this.boxShadow,
    this.color = Colors.white,
    this.borderRadius,
    this.child,
    this.onTap,
    this.borderColor = Colors.grey,
    this.borderWidth = 1,
    this.borderOpacity = 0.5,
  });

  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color color;
  final Color borderColor;
  final double borderWidth;
  final double borderOpacity;
  final BorderRadiusGeometry? borderRadius;
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
                  color: color,
                  border: Border.all(
                    color: borderColor.withOpacity(borderOpacity),
                    width: borderWidth,
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
                  boxShadow: boxShadow,
                  color: color,
                  border: Border.all(
                    color: borderColor.withOpacity(borderOpacity),
                    width: borderWidth,
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
