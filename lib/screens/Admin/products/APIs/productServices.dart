// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'dart:io';
import 'package:bilaw_waye/Constants/error_handling.dart';
import 'package:bilaw_waye/models/products.dart';
// import 'package:bilaw_waye/screens/Cilent/Details/product_detail.dart';
import 'package:http/http.dart' as http;
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';

class ProducSercives {
  seveProduct({
    required BuildContext context,
    required String name,
    required String category,
    required File image,
    required String description,
    required int price,
    required int countInStock,
  }) async {
    try {
      // ignore: unused_local_variable
      String imageUrl = '';
      final cloudinary =
          CloudinaryPublic('duhaq3yxh', 'ml_default', cache: false);
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image, folder: name),
      );
      imageUrl = response.secureUrl;
      http.Response res = await http
          .post(Uri.parse('https://ecommerce-vf9p.onrender.com/api/products'),
              body: jsonEncode({
                "name": name,
                "category": category,
                "image": imageUrl,
                "description": description,
                "price": price,
                "countInStock": countInStock,
              }),
              headers: {'Content-Type': 'application/json; charset=UTF-8'});
      // print(res.body);
      httpErrorHandling(
          context: context,
          response: res,
          onSuccess: () {
            Navigator.pop(context);
          });
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
  }

  Future<List<Products>> fechAllProducts(BuildContext context) async {
    List<Products> productList = [];

    try {
      http.Response res = await http.get(
          Uri.parse('https://ecommerce-vf9p.onrender.com/api/products'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});

      httpErrorHandling(
          context: context,
          response: res,
          onSuccess: () {
            for (var i = 0; i < jsonDecode(res.body).lenght; i++) {
              productList
                  .add(Products.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      ShowSnackBar(context, e.toString());
    }
    return productList;
  }
}
