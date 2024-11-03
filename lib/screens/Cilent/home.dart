
import 'package:bilaw_waye/screens/Cilent/account/user.dart';
import 'package:bilaw_waye/screens/Cilent/cart/cart.dart';
import 'package:bilaw_waye/screens/Cilent/shop/shop.dart';
import 'package:bilaw_waye/screens/Cilent/wishlit/wishlit.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

// ignore: camel_case_types
class _homeScreenState extends State<homeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index == 0
          ? const ShopScreen()
          : index == 1
              ? const WishlitScreen()
              : index == 2
                  ? const CartScreen()
                  : const AccountScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        onTap: ((value) {
          index = value;
          setState(() {});
        }),
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
        ],
      ),
    );
  }
}
