import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piggy/src/common_widget/containers/gradient_container_widget.dart';
import 'package:piggy/src/constants/sizes.dart';

class CustomDatePickerWidget extends StatefulWidget {
  const CustomDatePickerWidget({super.key});

  @override
  State<CustomDatePickerWidget> createState() => _CustomDatePickerWidgetState();
}

class _CustomDatePickerWidgetState extends State<CustomDatePickerWidget> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GradientContainer(
        onTap: () => _selectDate(context),
        width: 120,
        height: 100,
        borderRadius: BorderRadius.circular(mContainerMediumRadius),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat.MMMM().format(_selectedDate),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              DateFormat.d().format(_selectedDate),
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
