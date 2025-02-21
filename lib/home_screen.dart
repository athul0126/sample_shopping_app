import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  final List<String> filters = const [
    "Mobiles",
    "Laptops",
    "Electronics",
    "Fashion",
    "Home & Kitchen",
    "Beauty",
    "Sports",
  ];
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
                    child: Chip(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: const Color.fromARGB(255, 248, 246, 246)),
                          borderRadius: BorderRadius.circular(30)),
                      label: Text(filter),
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                      backgroundColor: const Color.fromARGB(255, 248, 246, 246),
                    ),
                  );
                },
                itemCount: filters.length,
              ),
            ),
          )
        ],
      )),
    );
  }
}
