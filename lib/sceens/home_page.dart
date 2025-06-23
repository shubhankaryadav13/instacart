import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instacart/colors/colors.dart';
import 'package:instacart/widgets/HorizontalCardList.dart';
import 'package:instacart/widgets/HorizontalColorList.dart';
import 'package:instacart/widgets/HorizontalTransparent.dart';

import '../widgets/HorizontalTrendingList.dart';

class DashbordPage extends StatefulWidget {
  const DashbordPage({super.key});

  @override
  State<DashbordPage> createState() => _DashbordPageState();
}

class _DashbordPageState extends State<DashbordPage> {
  int _currentIndex = 0;

  final List<Widget> _carouselItems = [
    Container(
      color: Colors.red,
      child: Center(child: Text('Slide 1', style: TextStyle(color: Colors.white, fontSize: 24))),
    ),
    Container(
      color: Colors.green,
      child: Center(child: Text('Slide 2', style: TextStyle(color: Colors.white, fontSize: 24))),
    ),
    Container(
      color: Colors.blue,
      child: Center(child: Text('Slide 3', style: TextStyle(color: Colors.white, fontSize: 24))),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          '𝖨𝗇𝗌𝗍𝖺𝖼𝖺𝗋𝗍',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_shopping_cart, color: Colors.black, size: 25),
            tooltip: 'Cart Icon',
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.appColor,
        foregroundColor: AppColors.appColorGreen,
        elevation: 50.0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black, size: 25),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                color: Colors.black,
                child: Column(
                  children: [
                    CarouselSlider(
                      items: _carouselItems,
                      options: CarouselOptions(
                        height: 200,
                        aspectRatio: 16 / 9,
                        initialPage: 0,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.2,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _carouselItems.asMap().entries.map((entry) {
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == entry.key
                                ? Colors.white
                                : Colors.white.withOpacity(0.4),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              const Text(
                'Featured Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const HorizontalColorList(),
              const SizedBox(height: 10),
              const HorizontalCardList(),
              const SizedBox(height: 10),
              const Text(
                'Popular Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              HorizontalTransparent(), // grid-based list
              const SizedBox(height: 20),
              const Text(
                'Deals Of The Day',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const HorizontalTrendingList(),


              // Add more widgets below the carousel if needed
            ],
          ),
        ),
      ),
    );
  }
}
