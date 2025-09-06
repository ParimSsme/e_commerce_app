import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;

  const SearchTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.hintText = "Search here",
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, _) {
        return TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: const Icon(
              Icons.search_sharp,
              color: AppColors.grey,
              size: 33,
            ),
            suffix: value.text.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        controller.clear();
                        if (onChanged != null) {
                          onChanged!("");
                        }
                      },
                      child: const CircleAvatar(
                        radius: 13,
                        backgroundColor: AppColors.black,
                        child: Icon(
                          Icons.close,
                          size: 18, // smaller icon
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 0,
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        );
      },
    );
  }
}
