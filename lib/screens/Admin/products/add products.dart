import 'dart:io';

import 'package:bilaw_waye/Constants/constants.dart';
import 'package:bilaw_waye/common_widget/textField.dart';
import 'package:bilaw_waye/screens/Admin/products/APIs/productServices.dart';
import 'package:flutter/material.dart';

class add_products extends StatefulWidget {
  const add_products({super.key});

  @override
  State<add_products> createState() => _add_productsState();
}

class _add_productsState extends State<add_products> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController descontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController countInStockcontroller = TextEditingController();

  File? image;
  final ProducSercives producSercives = ProducSercives();
  String category = '';

  void save() {
    producSercives.seveProduct(
        context: context,
        name: namecontroller.text,
        category: category,
        image: image!,
        description: descontroller.text,
        price: int.parse(pricecontroller.text),
        countInStock: int.parse(countInStockcontroller.text));
  }

  void selectImage() async {
    var res = await pickImage();
    image = res;
    setState(() {});
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AddProducts')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: selectImage,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: image == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.file_open),
                            Text('select product image')
                          ],
                        )
                      : Image.file(image!),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              customTextField(
                  controller: namecontroller, hint: 'Enter product name'),
              SizedBox(
                height: 20,
              ),
              Text(
                'selecte product category',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 19),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Constants.categoryImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    var cat = Constants.categoryImages[index];
                    return Row(
                      children: [
                        Checkbox(
                            value: selectedIndex == index ? true : false,
                            onChanged: ((value) {
                              selectedIndex = index;
                              category = cat['title'].toString();
                              setState(() {});
                            })),
                        Text(cat['title'].toString())
                      ],
                    );
                  },
                ),
              ),
              customTextField(
                controller: descontroller,
                hint: 'Enter product description',
                maxline: 6,
              ),
              SizedBox(
                height: 20,
              ),
              customTextField(
                  controller: pricecontroller, hint: 'Enter product prise'),
              SizedBox(
                height: 20,
              ),
              customTextField(
                  controller: countInStockcontroller,
                  hint: 'Enter product Quantity'),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
            onPressed: save,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('save'),
            )),
      ),
    );
    
  }
}
