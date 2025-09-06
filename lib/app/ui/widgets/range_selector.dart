import 'package:flutter/material.dart';

class RangeSelector extends StatefulWidget {
  final double min;
  final double max;
  final RangeValues initialRange;
  final ValueChanged<RangeValues>? onChanged;

  const RangeSelector({
    super.key,
    required this.min,
    required this.max,
    required this.initialRange,
    this.onChanged,
  });

  @override
  State<RangeSelector> createState() => _RangeSelectorState();
}

class _RangeSelectorState extends State<RangeSelector> {
  late RangeValues _currentRange;

  @override
  void initState() {
    super.initState();
    _currentRange = widget.initialRange;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$ ${_currentRange.start.toStringAsFixed(0)}"),
            Text("\$ ${_currentRange.end.toStringAsFixed(0)}"),
          ],
        ),
        RangeSlider(
          values: _currentRange,
          min: widget.min,
          max: widget.max,
          divisions: (widget.max - widget.min).toInt(),
          activeColor: Colors.deepPurple,
          inactiveColor: Colors.grey.shade300,
          onChanged: (values) {
            setState(() {
              _currentRange = values;
            });
            widget.onChanged?.call(values);
          },
        ),
      ],
    );
  }
}
