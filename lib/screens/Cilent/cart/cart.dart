import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My cart'),
        backgroundColor: const Color.fromARGB(255, 206, 51, 188),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}