import 'package:flutter/material.dart';

import '../model/ProductItem.dart';
import 'TrendingItemCard.dart';

class HorizontalTrendingList extends StatelessWidget {
  const HorizontalTrendingList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductItem> items = [
      ProductItem(title: "Apple", imageUrl: '', bgColor: Colors.black, rating: 4.5),
      ProductItem(title: "Banana", imageUrl: '', bgColor: Colors.black, rating: 2.3),
      ProductItem(title: "Carrot", imageUrl: '', bgColor: Colors.black, rating: 3.8),
    ];

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return TrendingItemCard(product: items[index]);
        },
      ),
    );
  }
}
