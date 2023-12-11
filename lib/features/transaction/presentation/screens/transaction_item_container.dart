import 'package:flutter/material.dart';
import 'package:piggy/features/transaction/presentation/widgets/list_builder_widget.dart';

class TransactionContainer extends StatefulWidget {
  const TransactionContainer({super.key});

  @override
  State<TransactionContainer> createState() => _TransactionContainerState();
}

class _TransactionContainerState extends State<TransactionContainer> {
  bool isSelectionMode = false;
  final int listLength = 30;
  late List<bool> _selected;
  bool _selectAll = false;
  bool _isGridMode = false;

  @override
  void initState() {
    super.initState();
    initializeSelection();
  }

  void initializeSelection() {
    _selected = List<bool>.generate(listLength, (_) => false);
  }

  @override
  void dispose() {
    _selected.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListBuilderWidget(
      isSelectionMode: isSelectionMode,
      selectedList: _selected,
      onSelectionChange: (bool x) {
        setState(() {
          isSelectionMode = x;
        });
      },
    );
  }
}
