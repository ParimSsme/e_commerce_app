import 'package:e_commerce_app/app/ui/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class RangeSelector extends StatefulWidget {
  final double min;
  final double max;
  final String title;
  final RangeValues initialRange;
  final ValueChanged<RangeValues>? onChanged;

  const RangeSelector({
    super.key,
    required this.min,
    required this.max,
    this.title = '',
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
        Text(widget.title, style: AppTextStyles.headlineSmall),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$ ${_currentRange.start.toStringAsFixed(0)}",
              style: AppTextStyles.displayLarge
            ),
            Text(
              "\$ ${_currentRange.end.toStringAsFixed(0)}",
              style: AppTextStyles.displayLarge,
            ),
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
