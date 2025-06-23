import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import '../model/ProductItem.dart';
import 'HorizontalCardList.dart';

class HorizontalTransparent extends StatefulWidget {
  const HorizontalTransparent({Key? key}) : super(key: key);

  @override
  State<HorizontalTransparent> createState() => _HorizontalTransparentState();
}

class _HorizontalTransparentState extends State<HorizontalTransparent> {
  int starCount = 5;

  final List<ProductItem> items = [
    ProductItem(
      title: "Everyday Fresh & Clean with Our Products",
      imageUrl: "https://www.pngplay.com/wp-content/uploads/2/Onion-Transparent-Image.png",
      bgColor: Color(0xFFffffff),
      rating: 3.5,
    ),
    ProductItem(
      title: "Make your Breakfast Healthy and Easy",
      imageUrl: "https://cdn.accentuate.io/6128703242393/1618586766263/Frobishers_Juice_Orange-(1).png?v=1654507650835",
      bgColor: Color(0xFFffffff),
      rating: 4.0,
    ),
    ProductItem(
      title: "The best Organic Products Online",
      imageUrl: "https://www.pngplay.com/wp-content/uploads/8/Vegetable-Transparent-Free-PNG.png",
      bgColor: Color(0xFFffffff),
      rating: 2.5,
    ),
    ProductItem(
      title: "The best Organic Products Online food",
      imageUrl: "https://www.pngplay.com/wp-content/uploads/8/Vegetable-Transparent-Free-PNG.png",
      bgColor: Color(0xFFffffff),
      rating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return Stack(
          children: [
            // Card UI
            Container(
              padding: const EdgeInsets.all(10),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        onRatingChanged: null, // Optional: make non-interactive
                      ),
                      Text(
                        '(${item.rating})',
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
                        icon: Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 20,),
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

            // "New" Tag
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
      },
    );
  }
}
