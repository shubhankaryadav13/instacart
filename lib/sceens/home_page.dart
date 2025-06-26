import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instacart/colors/colors.dart';
import 'package:instacart/widgets/HorizontalCardList.dart';
import 'package:instacart/widgets/HorizontalColorList.dart';
import '../widgets/AnimatedContentSlider.dart';
import '../widgets/HorizontalTransparent.dart';
import '../widgets/HorizontalTrendingList.dart';
import '../widgets/instacart_instruction.dart';

class DashbordPage extends StatefulWidget {
  const DashbordPage({super.key});

  @override
  State<DashbordPage> createState() => _DashbordPageState();
}

class _DashbordPageState extends State<DashbordPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(
          '𝖨𝗇𝗌𝗍𝖺𝖼𝖺𝗋𝗍',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 25),
            tooltip: 'Cart Icon',
            onPressed: () {},
          ),
        ],
        backgroundColor: Color(0xFF5B6840),
        foregroundColor: AppColors.appColorGreen,
        elevation: 50.0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white, size: 25),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContentSlider(),
              const SizedBox(height: 10),
              const Text(
                '𝖶𝗁𝗒 𝖨𝗇𝗌𝗍𝖺𝖼𝖺𝗋𝗍?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Shop from your favorite stores,get groceries from top brands delivered to your door',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              instacartInstruction(),
              const HorizontalCardList(),
              const SizedBox(height: 10),
              const Text(
                'Deals Of The Day',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
