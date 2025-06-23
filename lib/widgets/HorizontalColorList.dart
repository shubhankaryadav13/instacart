import 'package:flutter/material.dart';



class HorizontalColorList extends StatelessWidget {
  const HorizontalColorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of colors for items
    final List<Color> itemColors = [
      Color(0xFFfff3eb),
      Color(0xFFebffee),
      Color(0xFFffebf1),
      Color(0xFFfff3eb),
      Color(0xFFfff3eb),
      Color(0xFFebffee),
      Color(0xFFffebf1),
      Color(0xFFfff3eb),
    ];
    return SizedBox(
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemColors.length,
          itemBuilder: (context, index) {
            return Container(
              width: 120,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: itemColors[index], // use color here only
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white54,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  )
                ],
              ),
              child: Center(
                child: Column(
                  children: [
                    Image.network(
                      'https://freepngimg.com/download/apple/9-apple-png-image.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Red Apple',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    Text(
                      '${index + 1} Item',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}
