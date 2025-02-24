import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  const ProductCard(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top:5,bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color:const Color.fromARGB(255, 244, 241, 241),
          borderRadius: BorderRadius.circular(25)
        ),
        // height: 600,
        child: Column(
          children: [
            Text(title),
            Image.network(imageUrl,fit: BoxFit.contain,height: 200,),
            Text(price.toString())
          ],
        ),
      ),
    );
  }
}
