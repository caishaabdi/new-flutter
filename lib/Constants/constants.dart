import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Constants {
  static const List<String> carouselImages = [
    'assets/images/slider1.png',
    'assets/images/slider2.png',
    'assets/images/slider3.png',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Shirts',
      'image': "assets/images/hawaiian-shirt.png",
    },
    {
      'title': 'Laptop',
      'image': "assets/images/laptop-screen.png",
    },
    {
      'title': 'Hijab',
      'image': "assets/images/woman.png",
    },
    {
      'title': 'Shoes',
      'image': "assets/images/shoes.png",
    },
    {
      'title': "Smartphones",
      'image': "assets/images/smartphone.png",
    }
  ];
}

Future<File?> pickImage() async {
  File? image;
  try {
    var file = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);

    if (file != null && file.files.isNotEmpty) {
      image = File(file.files[0].path!);
    }
  } catch (e) {
    debugPrint(e.toString());
  }

  return image;
}
