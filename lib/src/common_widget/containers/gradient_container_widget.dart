import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    this.padding,
    this.width,
    this.height,
    this.boxShadow,
    this.beginColor = Colors.blue,
    this.endColor = Colors.blueAccent,
    this.borderRadius,
    this.beginColorAlignment = Alignment.topCenter,
    this.endColorAlignment = Alignment.bottomCenter,
    this.child,
  });

  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Color beginColor;
  final Color endColor;
  final BorderRadiusGeometry? borderRadius;
  final Alignment beginColorAlignment;
  final Alignment endColorAlignment;
  final Widget? child;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return boxShadow == null
        ? Container(
            padding: padding,
            width: width,
            height: height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
              borderRadius: borderRadius,
              gradient: LinearGradient(
                begin: beginColorAlignment,
                end: endColorAlignment,
                colors: [beginColor, endColor],
              ),
            ),
            child: child,
          )
        : Container(
            padding: padding,
            width: width,
            height: height,
            decoration: BoxDecoration(
              boxShadow: boxShadow!,
              borderRadius: borderRadius,
              gradient: LinearGradient(
                begin: beginColorAlignment,
                end: endColorAlignment,
                colors: [beginColor, endColor],
              ),
            ),
            child: child,
          );
  }
}

class ThousandsFormatter extends TextInputFormatter {

  final NumberFormat _formatter = NumberFormat('#,###');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    final int selectionOffset = newValue.selection.baseOffset;
    final String newString = _formatter.format(double.parse(newValue.text));
    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: selectionOffset + 1),
    );
  }
}
