import 'package:e_commerce_app/app/ui/widgets/action_tile.dart';
import 'package:e_commerce_app/app/ui/widgets/range_selector.dart';
import 'package:e_commerce_app/app/ui/widgets/selectable_chip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../widgets/circle_icon_button.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleIconButton(
            iconSize: 30,
            onPressed: Get.back,
            icon: Icons.arrow_back,
          ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.3, end: 0),
        ),
        title: const Text('Filter')
            .animate(delay: 200.ms)
            .fadeIn(duration: 500.ms)
            .slideY(begin: -0.2, end: 0)
            .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20,
            children: [
              const SelectableChipList(
                options: ['All', 'Men', 'Women'],
                title: 'Gender',
                selectedItems: ['All'],
              )
                  .animate(delay: 300.ms)
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: 0.2, end: 0, curve: Curves.easeOut)
                  .scale(
                      begin: const Offset(0.8, 0.8), end: const Offset(1, 1)),

              const SelectableChipList(
                options: ['Adidas', 'Puma', 'CR7', 'Nike', 'Yeezy', 'Supreme'],
                title: 'Brand',
                selectedItems: ['Puma', 'Nike', 'Supreme'],
              )
                  .animate(delay: 400.ms)
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: 0.2, end: 0, curve: Curves.easeOut)
                  .scale(
                      begin: const Offset(0.85, 0.85), end: const Offset(1, 1)),

              const RangeSelector(
                min: 16,
                max: 100,
                title: 'Price Range',
                initialRange: RangeValues(25, 75),
              )
                  .animate(delay: 500.ms)
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: 0.2, end: 0, curve: Curves.easeOut)
                  .blurXY(begin: 10, end: 0), // soft blur entrance

              const SelectableChipList(
                options: ['White', 'Black', 'Grey', 'Yellow', 'Red', 'Green'],
                selectedItems: ['Black', 'Yellow', 'Green'],
                title: 'Color',
              )
                  .animate(delay: 600.ms)
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: 0.2, end: 0, curve: Curves.easeOut)
                  .scale(
                      begin: const Offset(0.85, 0.85), end: const Offset(1, 1)),

              ActionTile(
                onTap: (){},
                title: 'Another option',
              ),
              const Spacer(),

              ElevatedButton(
                child: const Text(
                  'Apply Filter',
                ),
                onPressed: () => Get.back(),
              )
                  .animate(delay: 700.ms)
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: 0.3, end: 0, curve: Curves.easeOutBack)
                  .scale(
                      begin: const Offset(0.7, 0.7),
                      end: const Offset(1, 1),
                      curve: Curves.elasticOut),
            ],
          ),
        ),
      ),
    );
  }
}
