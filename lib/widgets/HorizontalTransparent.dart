import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import '../model/ProductItem.dart';

class HorizontalTransparent extends StatelessWidget {
   HorizontalTransparent({Key? key}) : super(key: key);

  final List<ProductItem> items = [
    ProductItem(
      title: "Everyday Fresh & Clean with Our Products",
      imageUrl: "https://www.pngplay.com/wp-content/uploads/2/Onion-Transparent-Image.png",
      bgColor: const Color(0xFFFFFFFF),
      rating: 3.5,
    ),
    ProductItem(
      title: "Make your Breakfast Healthy and Easy",
      imageUrl: "https://cdn.accentuate.io/6128703242393/1618586766263/Frobishers_Juice_Orange-(1).png?v=1654507650835",
      bgColor: const Color(0xFFFFFFFF),
      rating: 4.0,
    ),
    ProductItem(
      title: "The best Organic Products Online",
      imageUrl: "https://www.pngplay.com/wp-content/uploads/8/Vegetable-Transparent-Free-PNG.png",
      bgColor: const Color(0xFFFFFFFF),
      rating: 2.5,
    ),
    ProductItem(
      title: "The best Organic Products Online food",
      imageUrl: "https://www.pngplay.com/wp-content/uploads/8/Vegetable-Transparent-Free-PNG.png",
      bgColor: const Color(0xFFFFFFFF),
      rating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double itemWidth = (constraints.maxWidth - 24) / 2;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items.map((item) {
              return SizedBox(
                width: itemWidth,
                child: buildCard(item),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget buildCard(ProductItem item) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: item.bgColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.green, width: 1),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.network(
                  item.imageUrl,
                  height: 89,
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Row(
                children: const [
                  Text('Banana', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('50 min', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  StarRating(
                    size: 16.0,
                    rating: item.rating,
                    color: Colors.orange,
                    borderColor: Colors.grey,
                    allowHalfRating: true,
                    starCount: 5,
                    onRatingChanged: null,
                  ),
                  Text(
                    ' (${item.rating})',
                    style: const TextStyle(fontSize: 12, color: Colors.black38, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: const [
                  Text('By Kumar', style: TextStyle(fontSize: 12, color: Colors.black38, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('500 g', style: TextStyle(fontSize: 12, color: Colors.black38, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Text(
                    '\$23.90',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    '\$23.90',
                    style: TextStyle(fontSize: 12, color: Colors.black38, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: () => print('Shop Now Clicked'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 20),
                    label: const Text(
                      'Add',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 60,
            height: 28,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            child: const Text(
              'New',
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
