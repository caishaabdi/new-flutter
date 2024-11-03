import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: non_constant_identifier_names
void ShowSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 5),
  ));
}

//named prameter
void httpErrorHandling(
    {required BuildContext context,
    required http.Response response,
    required VoidCallback onSuccess}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 201:
      onSuccess();
      break;
    case 400:
      ShowSnackBar(context, jsonDecode(response.body)['message']);
      break;
      case 404:
      ShowSnackBar(context, jsonDecode(response.body)['message']);
      break;
      case 500:
      ShowSnackBar(context, jsonDecode(response.body)['error']);
      break;
      default:
      ShowSnackBar(context, jsonDecode(response.body));
  }
}
