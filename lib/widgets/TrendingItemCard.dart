import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../model/ProductItem.dart';


class TrendingItemCard extends StatelessWidget {
  final ProductItem product;

  const TrendingItemCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Fixed width for horizontal scrolling
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          // Background Image
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/banner.png",
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Time Counter Row
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTimeBox('305', 'Days'),
                  SizedBox(width: 5),
                  _buildTimeBox('12', 'Hours'),
                  SizedBox(width: 5),
                  _buildTimeBox('36', 'Mins'),
                  SizedBox(width: 5),
                  _buildTimeBox('59', 'Secs'),
                ],
              ),
            ),
          ),

          // Bottom product card
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 140,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        StarRating(
                          size: 16.0,
                          rating: product.rating,
                          color: Colors.orange,
                          borderColor: Colors.grey,
                          allowHalfRating: true,
                          starCount: 5,
                          onRatingChanged: null,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${product.rating})',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black38, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Text('By Kumar',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold)),
                        Spacer(),
                        Text('500 g',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text(
                          '\$23.90',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '\$29.90',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough),
                        ),
                        const Spacer(),
                        ElevatedButton.icon(
                          onPressed: () => print('Shop Now Clicked'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding:
                            const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          icon: Icon(Icons.shopping_cart_outlined,
                              color: Colors.white, size: 20),
                          label: const Text(
                            'Add',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Time box widget
  Widget _buildTimeBox(String value, String label) {
    return Container(
      height: 80,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white70, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value,
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          Text(label,
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 12)),
        ],
      ),
    );
  }
}
