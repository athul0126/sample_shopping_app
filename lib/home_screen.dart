import 'package:flutter/material.dart';
import 'package:sample_shopping_app/global_variables.dart';
import 'package:sample_shopping_app/product_card.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<String> filters = const [
    "All",
    "Mobiles",
    "Laptops",
    "Electronics",
    "Fashion",
    "Home & Kitchen",
    "Beauty",
    "Sports",
  ];
  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Shopping\nApp",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: const Color.fromARGB(255, 239, 237, 237),
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        label: Text(filter),
                        padding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                        backgroundColor: selectedFilter == filter
                            ? Colors.amber
                            : const Color.fromARGB(255, 239, 237, 237),
                      ),
                    ),
                  );
                },
                itemCount: filters.length,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final product = products[index];
                print(product);
                return ProductCard(
                    title: product['title'] as String,
                    imageUrl: product['imageUrl'] as String,
                    price: product['price'] as double);
              },
              itemCount: 2,
            ),
          )
        ],
      )),
    );
  }
}
