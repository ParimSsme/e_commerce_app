import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../widgets/carousel_slider_item.dart';
import '../widgets/home_list_item.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Carousel
            CarouselSliderItem(),

            const SizedBox(height: 20),

            /// Featured Products
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Featured", style: textTheme.titleMedium),
                TextButton(onPressed: () {}, child: const Text("See All")),
              ],
            ),
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.featuredList.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (_, i) =>
                    HomeListItem(item: controller.featuredList[i]),
              ),
            ),

            const SizedBox(height: 20),

            /// Popular Products
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Most Popular", style: textTheme.titleMedium),
                TextButton(onPressed: () {}, child: const Text("See All")),
              ],
            ),
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.popularList.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (_, i) =>
                    HomeListItem(item: controller.popularList[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}