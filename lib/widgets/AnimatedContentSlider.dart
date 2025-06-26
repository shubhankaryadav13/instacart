import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../view_model/SliderViewModel.dart';

class AnimatedContentSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SliderViewModel>(
      builder: (context, sliderVM, child) {
        if (sliderVM.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            CarouselSlider(
              items: sliderVM.sliders.map((slide) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF5B6840).withOpacity(0.4),
                        Color(0xFF5B6840).withOpacity(0.85),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(slide.Title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                )),
                            const SizedBox(height: 5),
                            Text(slide.Subtitle,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                    color: Colors.white
                                )),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                debugPrint("Shop now: ${slide.Title}");
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text("Shop Now",style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: Image.asset(
                          slide.ImagePath,
                          fit: BoxFit.fitWidth,
                          errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported,color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 200,
                viewportFraction: 1.0,
                autoPlay: true,
                enlargeCenterPage: false,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
              ),
            ),
          ],
        );
      },
    );
  }
}
