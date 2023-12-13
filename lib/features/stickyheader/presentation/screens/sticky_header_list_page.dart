import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../widgets/list_builder_widget.dart';

class StickyHeaderListPage extends StatefulWidget {
  const StickyHeaderListPage({super.key});

  @override
  State<StickyHeaderListPage> createState() => _StickyHeaderListPageState();
}

class _StickyHeaderListPageState extends State<StickyHeaderListPage> with AutomaticKeepAliveClientMixin {
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
    super.build(context);
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



  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
