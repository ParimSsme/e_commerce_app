import 'package:e_commerce_app/app/ui/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../widgets/carousel_slider_item.dart';
import '../widgets/home_list_item.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 1. Carousel
              CarouselSliderItem()
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: -0.2, end: 0),

              const SizedBox(height: 20),

              /// 2. Featured Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Featured", style: textTheme.titleMedium),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProductsScreen(),
                      ),
                    ),
                    child: const Text("See All"),
                  ),
                ],
              )
                  .animate(delay: 300.ms) // appears after carousel
                  .fadeIn(duration: 500.ms)
                  .slideX(begin: -0.2, end: 0),

              /// 3. Featured List
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.featuredList.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (_, i) => HomeListItem(
                    item: controller.featuredList[i],
                  )
                      .animate(delay: (500 + i * 150).ms) // sequential per item
                      .fadeIn(duration: 400.ms)
                      .scale(begin: const Offset(0.8, 0.8), end: Offset(1, 1)),
                ),
              ),

              const SizedBox(height: 20),

              /// 4. Popular Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Most Popular", style: textTheme.titleMedium),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See All"),
                  ),
                ],
              )
                  .animate(delay: 1000.ms) // appears after featured section
                  .fadeIn(duration: 500.ms)
                  .slideX(begin: 0.2, end: 0),

              /// 5. Popular List
              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.popularList.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (_, i) => HomeListItem(
                    item: controller.popularList[i],
                  )
                      .animate(delay: (1200 + i * 150).ms) // sequential per item
                      .fadeIn(duration: 400.ms)
                      .scale(begin: const Offset(0.8, 0.8), end: Offset(1, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
