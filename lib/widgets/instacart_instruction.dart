import 'package:flutter/material.dart';
import 'package:instacart/view_model/header_view_model.dart';
import 'package:provider/provider.dart';
import '../model/instInstructionModel.dart';

class instacartInstruction extends StatelessWidget {
  instacartInstruction({Key? key}) : super(key: key);


  final List<Instinstructionmodel> items = [
    Instinstructionmodel(
      title: "Shame-day delivery",
      imageUrl: "assets/icons/deliveryvan.png",
      bgColor: const Color(0xFF5B6840),
      rating: 3.5,
    ),
    Instinstructionmodel(
      title: "Everyday low price",
      imageUrl: "assets/icons/lowprice.png",
      bgColor: const Color(0xFF5B6840),
      rating: 4.0,
    ),
    Instinstructionmodel(
      title: "Quality guarantee",
      imageUrl: "assets/icons/guarntee.png",
      bgColor: const Color(0xFF5B6840),
      rating: 2.5,
    ),
    Instinstructionmodel(
      title: "No membership fees ",
      imageUrl: "assets/icons/member.png",
      bgColor: const Color(0xFF5B6840),
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

  Widget buildCard(Instinstructionmodel item) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: item.bgColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white54, width: 1),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(item.imageUrl,color: Colors.white,height: 50,width: 50),
              const SizedBox(height: 4),
              Text(
                item.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
