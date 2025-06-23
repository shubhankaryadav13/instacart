import 'package:flutter/material.dart';

import '../model/ProductItem.dart';

class HorizontalCardList extends StatelessWidget {
  const HorizontalCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ProductItem> items = [
      ProductItem(
        title: "Everyday Fresh & Clean with Our Products",
        imageUrl: "https://www.pngplay.com/wp-content/uploads/2/Onion-Transparent-Image.png",
        bgColor: Color(0xFFfff3eb), rating: 0.0,
      ),
      ProductItem(
          title: "Make your Breakfast Healthy and Easy",
          imageUrl: "https://cdn.accentuate.io/6128703242393/1618586766263/Frobishers_Juice_Orange-(1).png?v=1654507650835",
          bgColor: Color(0xFFebffee),
          rating: 0.0
      ),

      ProductItem(
          title: "The best Organic Products Online",
          imageUrl: "https://www.pngplay.com/wp-content/uploads/8/Vegetable-Transparent-Free-PNG.png",
          bgColor: Color(0xFFffebf1),
          rating: 0.0
      ),
    ];

    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            width: 300,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: item.bgColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text content on the left
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () {
                            print('Shop Now Clicked');
                          },
                          icon: const SizedBox.shrink(), // Hides the default icon position (left)
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('Shop Now',style: TextStyle(color: Colors.white),),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward,color: Colors.white,), // Right-side icon
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0), // No rounded corners
                            ),
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                        ),


                      ],
                    ),
                  ),
                  // Image on the right
                  Image.network(
                    item.imageUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

