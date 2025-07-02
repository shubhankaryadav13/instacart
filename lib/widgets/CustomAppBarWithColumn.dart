import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instacart/widgets/search_bar.dart';

class CustomAppBarWithColumn extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarWithColumn({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: const BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: const Text(
                    "Plot No 48 Kh No 54/10 Village Jonapur, New Delhi-110047",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.arrow_drop_down,color: Colors.white,size: 40)
              ],
            ),
            const SizedBox(height: 6),
            SimpleSearchBar(onChanged: (String value) {
              // do something with value
            }),
          ],
        ),
      ),
    );
  }
}
