import 'package:flutter/material.dart';

class CategoriesListItem extends StatefulWidget {
  const CategoriesListItem({super.key});

  @override
  State<CategoriesListItem> createState() => _CategoriesListItemState();
}

class _CategoriesListItemState extends State<CategoriesListItem> {
  final List<String> categories = ["Fruits", "Vegetables", "Bakery", "Snacks", "Drinks"];
  int selectedIndex = 0;

  // Dummy data for each category
  final Map<String, List<String>> categoryItems = {
    "Fruits": ["Apple", "Banana", "Orange", "Mango"],
    "Vegetables": ["Carrot", "Potato", "Onion", "Tomato"],
    "Bakery": ["Bread", "Cake", "Cookies"],
    "Snacks": ["Chips", "Nachos", "Popcorn"],
    "Drinks": ["Coke", "Juice", "Water"]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(5, 10),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back_outlined, color: Colors.white, size: 30),
                  SizedBox(width: 20),
                  Text(
                    "Categories",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Row(
                children: [
                  // Left side category list
                  Container(
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xFF5B6840),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        bool isSelected = index == selectedIndex;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                        radius: 20,
                                        backgroundImage: AssetImage("assets/images/images/vej.png"),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        categories[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Vertical line indicator
                              Container(
                                width: 4,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.white : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // Right side item list
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: GridView.builder(
                        itemCount: categoryItems[categories[selectedIndex]]?.length ?? 0,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // number of columns
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                          childAspectRatio: 3, // width / height
                        ),
                        itemBuilder: (context, idx) {
                          String item = categoryItems[categories[selectedIndex]]![idx];
                          return Card(
                            color: const Color(0xFF5B6840),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: InkWell(
                              onTap: () {
                                // on item click
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            item,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
