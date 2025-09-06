import 'package:flutter/material.dart';

class SelectableChipList extends StatefulWidget {
  final String? title; // ✅ New title parameter
  final List<String> options;
  final List<String> selectedItems;
  final ValueChanged<List<String>>? onSelectionChanged;

  const SelectableChipList({
    super.key,
    this.title,
    required this.options,
    this.selectedItems = const [],
    this.onSelectionChanged,
  });

  @override
  State<SelectableChipList> createState() => _SelectableChipListState();
}

class _SelectableChipListState extends State<SelectableChipList> {
  late List<String> _selected;

  @override
  void initState() {
    super.initState();
    _selected = List.from(widget.selectedItems);
  }

  @override
  void didUpdateWidget(covariant SelectableChipList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedItems != widget.selectedItems) {
      _selected = List.from(widget.selectedItems);
    }
  }

  void _onChipTapped(String label) {
    setState(() {
      if (_selected.contains(label)) {
        _selected.remove(label);
      } else {
        _selected.add(label);
      }
    });
    widget.onSelectionChanged?.call(_selected);
  }

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (int i = 0; i < widget.options.length; i += 3) {
      final rowItems = widget.options.skip(i).take(3).toList();
      rows.add(
        Row(
          children: rowItems.map((option) {
            final isSelected = _selected.contains(option);
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ChoiceChip(
                  label: Center(child: Text(option)),
                  selected: isSelected,
                  selectedColor: Colors.deepPurple.shade200,
                  backgroundColor: Colors.grey.shade200,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                  onSelected: (_) => _onChipTapped(option),
                  showCheckmark: false,
                ),
              ),
            );
          }).toList(),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
            child: Text(
              widget.title!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        ...rows,
      ],
    );
  }
}




