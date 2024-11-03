import 'package:bilaw_waye/models/products.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class product_detail extends StatefulWidget {
  final Products product;
  const product_detail({super.key, required this.product});

  @override
  State<product_detail> createState() => _product_detailState();
}

// ignore: camel_case_types
class _product_detailState extends State<product_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: const Color.fromARGB(255, 248, 248, 213),
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Image.asset(widget.product.image)),
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_forward_ios)),
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_outline,
                                        color:
                                            Color.fromARGB(255, 97, 173, 248),
                                        size: 30,
                                      )),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.shopping_cart,
                                      color: Colors.blue,
                                      size: 30,
                                    ))
                              ],
                            ),
                          ])),
                ],
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(fontSize: 23),
                      ),
                      Text(
                        "\$" + widget.product.price.toString(),
                        style: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 74, 145, 251)),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(widget.product.description,
                          style:
                              const TextStyle(fontSize: 20, color: Colors.grey))
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: const Text(
            'Add to cart',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ))),
    );
  }
}
