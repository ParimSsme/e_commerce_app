import 'package:e_commerce_app/app/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

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
                  selectedColor: AppColors.primary,
                  backgroundColor: Colors.grey.shade200,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                  onSelected: (_) => _onChipTapped(option),
                  showCheckmark: false,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
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
          Text(
            widget.title!,
            style: AppTextStyles.headlineSmall,
          ),
        ],
        ...rows,
      ],
    );
  }
}




