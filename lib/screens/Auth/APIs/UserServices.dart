import 'dart:convert';

import 'package:bilaw_waye/provider/user_provider.dart';
import 'package:bilaw_waye/screens/Admin/Admin.dart';
import 'package:bilaw_waye/screens/Auth/login.dart';
import 'package:bilaw_waye/screens/Cilent/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  void register(
      {required BuildContext context,
      required String name,
      required String email,
      required String password,
      required String address,
      required int phone}) async {
    http.Response res = await http
        .post(Uri.parse('https://ecommerce-vf9p.onrender.com/api/users'),
            body: jsonEncode({
              "name": name,
              "email": email,
              "password": password,
              "address": address,
              "phone": phone,
            }),
            headers: {'Content-Type': 'application/json; charset=UTF-8'});
    print(res.statusCode);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: ((context) => loginScreen())),
        (route) => false);

    // ignore: empty_catches
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  // void login(String text, String text2) {}
  void login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    var user = Provider.of<Userprovider>(listen: false, context);
    http.Response res = await http
        .post(Uri.parse('https://ecommerce-vf9p.onrender.com/api/users/login'),
            body: jsonEncode({
              "email": email,
              "password": password,
            }),
            headers: {'Content-Type': 'application/json; charset=UTF-8'});
    // print(res.statusCode);
    if (res.statusCode == 200) {
      SharedPreferences PreferencesId = await SharedPreferences.getInstance();

      SharedPreferences preferencesToken =
          await SharedPreferences.getInstance();

      PreferencesId.setString('userId', jsonDecode(res.body)['_id']);
      preferencesToken.setString('tokenId', jsonDecode(res.body)['token']);

      user.setUser(res.body);

      user.user.isAdmin
          ? Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const adminScreen()),
              (route) => false)
          : Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const homeScreen()),
              (route) => false);
    }
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  logOut(BuildContext context) async {
    SharedPreferences PreferencesId = await SharedPreferences.getInstance();
    SharedPreferences preferencesToken = await SharedPreferences.getInstance();
    PreferencesId.setString('userId', '');
    preferencesToken.setString('tokenId', '');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: ((context) => const loginScreen())),
        (route) => false);
  }

  void getUserProfile(BuildContext context) async {
    SharedPreferences PreferencesId = await SharedPreferences.getInstance();
    SharedPreferences preferencesToken = await SharedPreferences.getInstance();

    var id = PreferencesId.getString('userId') ?? '';
    var token = preferencesToken.getString('tokenId') ?? '';
    // print(id);
    // print(token);
    if (token != '' && id != '') {
      http.Response res = await http.post(
          Uri.parse('https://ecommerce-vf9p.onrender.com/api/users/profile'),
          body: jsonEncode({
            "id": id,
            "token": token,
          }),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});

      if (res.statusCode == 200) {
        Provider.of<Userprovider>(listen: false, context).setUser(res.body);
      }
    }
  }
}
