import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:instacart/colors/colors.dart';
import '../model/ProductItem.dart';
import '../sceens/categories_list_item.dart';

class HorizontalTransparent extends StatelessWidget {
  HorizontalTransparent({Key? key}) : super(key: key);

  final List<ProductItem> items = [
    ProductItem(
      title: "Vegetables And Fruits",
      imageUrl: "https://www.pngplay.com/wp-content/uploads/2/Onion-Transparent-Image.png",
      bgColor: AppColors.skyBlue,
      rating: 3.5,
    ),
    ProductItem(
      title: "Atta Rice \& dal",
      imageUrl: "https://cdn.accentuate.io/6128703242393/1618586766263/Frobishers_Juice_Orange-(1).png?v=1654507650835",
      bgColor: AppColors.skyBlue,
      rating: 4.0,
    ),
    ProductItem(
      title: "Oil Ghee \& Masala",
      imageUrl: "https://www.pngplay.com/wp-content/uploads/8/Vegetable-Transparent-Free-PNG.png",
      bgColor: AppColors.skyBlue,
      rating: 2.5,
    ),
    ProductItem(
      title: "Dairy,Bread & Eggs",
      imageUrl: "https://www.pngplay.com/wp-content/uploads/8/Vegetable-Transparent-Free-PNG.png",
      bgColor: AppColors.skyBlue,
      rating: 4.5,
    ),
    ProductItem(
      title: "Bakery & Biscuits",
      imageUrl: "https://www.pngplay.com/wp-content/uploads/8/Vegetable-Transparent-Free-PNG.png",
      bgColor: AppColors.skyBlue,
      rating: 4.5,
    ),
    ProductItem(
      title: "Dry Fruits & Cereals",
      imageUrl: "https://www.pngplay.com/wp-content/uploads/8/Vegetable-Transparent-Free-PNG.png",
      bgColor: AppColors.skyBlue,
      rating: 4.5,
    ),
    ProductItem(
      title: "Kitchenware & Appliances",
      imageUrl: "https://www.pngplay.com/wp-content/uploads/8/Vegetable-Transparent-Free-PNG.png",
      bgColor: AppColors.skyBlue,
      rating: 4.5,
    ),
    ProductItem(
      title: "Products Online food",
      imageUrl: "https://www.pngplay.com/wp-content/uploads/8/Vegetable-Transparent-Free-PNG.png",
      bgColor: AppColors.skyBlue,
      rating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Ensure at least 4 items in a row
        double itemWidth = (constraints.maxWidth - 18) / 4;
        // Adjust spacing for 4 items (spacing: 6 * 3 = 18)
        return Wrap(
          spacing: 6,
          runSpacing: 6,
          children: items.map((item) {
            return SizedBox(
              width: itemWidth,
              child: buildCard(context,item),
            );
          }).toList(),
        );
      },
    );
  }

  Widget buildCard(BuildContext context,ProductItem item) {
    return InkWell(
      onTap: () {
        // Open the next screen and pass the item
        Navigator.push(context, MaterialPageRoute(builder: (_) => CategoriesListItem(),),);
      },
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: item.bgColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white54, width: 1),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(5, 10),
                ),
              ],
            ),
            child: Center(
              child: Image.network(
                item.imageUrl,
                height: 80,
                width: 80,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text(
              item.title,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }


}
