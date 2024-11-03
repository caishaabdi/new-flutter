import 'package:bilaw_waye/screens/Admin/products/products.dart';
import 'package:bilaw_waye/screens/Auth/APIs/UserServices.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class navigationDrawer extends StatelessWidget {
  const navigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 252, 243, 243),
      child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          children: [
            ListTile(
              // ignore: prefer_const_constructors
              contentPadding: EdgeInsets.all(0),
              leading: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child:
                    const CircleAvatar(radius: 30, child: Icon(Icons.person)),
              ),
              title: const Text('Leyuna'),
              subtitle: const Text('Leyuna@gmail.com'),
            ),
            const SizedBox(height: 50),
            ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const productsScreen()))),
              title: const Text('products'),
              leading: const Icon(Icons.list),
            ),
            const ListTile(
              title: Text('Orders'),
              leading: Icon(Icons.shopping_cart),
            ),
            const ListTile(
              title: Text('Users'),
              leading: Icon(Icons.group),
            ),
             ListTile(
              title: const Text('LogOut'),
              leading: const Icon(Icons.logout),
              onTap: (() => UserServices().logOut(context)),
            ),
          ]),
    );
  }
}
