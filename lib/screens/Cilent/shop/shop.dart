
import 'package:bilaw_waye/Constants/constants.dart';
import 'package:bilaw_waye/models/products.dart';
import 'package:bilaw_waye/screens/Cilent/Details/product_detail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    var sizeH = MediaQuery.of(context).size.height;
    var sizeW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', height: 70),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              size: 35,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blue)),
                          hintText: "Search products by Name",
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: sizeH * 0.07,
                      width: sizeW * 0.15,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 157, 135, 255),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.tune,
                        color: Colors.white,
                        size: 35,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        height: sizeH * 0.2),
                    items: Constants.carouselImages.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            i,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: sizeH * 0.07,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Constants.categoryImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      var cat = Constants.categoryImages[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                cat['image'].toString(),
                                width: 40,
                              ),
                              Text(cat['title'].toString())
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'New Arrival',
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(height: 10),
                Flexible(
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent: sizeH * 0.36),
                    itemCount: listProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      var products = listProducts[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => product_detail(
                                      product: products,
                                    )))),
                        child: Card(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 251, 244, 198)),
                                child: Image.asset(
                                  products.image,
                                  height: 150,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(products.name),
                              SizedBox(height: 5),
                              Text('\$' + products.price.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
