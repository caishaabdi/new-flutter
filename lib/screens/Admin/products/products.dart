import 'package:bilaw_waye/models/products.dart';
import 'package:bilaw_waye/screens/Admin/products/APIs/productServices.dart';
import 'package:bilaw_waye/screens/Admin/products/add%20products.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class productsScreen extends StatefulWidget {
  const productsScreen({super.key});

  @override
  State<productsScreen> createState() => _productsScreenState();
}

// ignore: camel_case_types
class _productsScreenState extends State<productsScreen> {
  ProducSercives producSercives = ProducSercives();
  List<Products> products = [];
  void loadProduct() async {
    products = await producSercives.fechAllProducts(context);

    setState(() {});

    @override
    void initState() {
      loadProduct();
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('products'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => add_products())));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 3,
            mainAxisExtent: size.height * 0.19,
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            var product = products[index];
            return Card(
              child: Container(
                height: 20,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Text(product.name),
                    Image.network(
                      product.image,
                      height: 50,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                          color: Colors.green,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
