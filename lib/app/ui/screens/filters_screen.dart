import 'package:e_commerce_app/app/ui/widgets/range_selector.dart';
import 'package:e_commerce_app/app/ui/widgets/rounded_text_button.dart';
import 'package:e_commerce_app/app/ui/widgets/selectable_chip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 48,
        leading: RawMaterialButton(
          onPressed: Get.back,
          fillColor: Colors.grey.shade200,
          padding: const EdgeInsets.only(left: 5.0),
          shape: const CircleBorder(),
          child: const Icon(Icons.arrow_back_ios, size: 24.0),
        ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.3, end: 0),
        title: const Text('Filter')
            .animate(delay: 200.ms)
            .fadeIn(duration: 500.ms)
            .slideY(begin: -0.2, end: 0),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SelectableChipList(options: ['All', 'Men', 'Women']),
              const SelectableChipList(options: [
                'Adidas',
                'Puma',
                'CR7',
                'Nike',
                'Yeezy',
                'Supreme'
              ]),
              const RangeSelector(
                  min: 16, max: 100, initialRange: RangeValues(25, 75)),
              const SelectableChipList(options: ['White', 'Black', 'Grey', 'Yellow', 'Red', 'Green']),
              const Spacer(),
              RoundedTextButton(text: 'Apply Filter', onPressed: () => Get.back()),
            ],
          ),
        ),
      ),
    );
  }
}
