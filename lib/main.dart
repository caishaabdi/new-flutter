// import 'package:ecommerce/screens/Admin/Admin.dart';
// import 'dart:js';

// import 'package:bilaw_waye/models/user.dart';
import 'package:bilaw_waye/provider/user_provider.dart';
import 'package:bilaw_waye/screens/Admin/Admin.dart';
import 'package:bilaw_waye/screens/Auth/APIs/UserServices.dart';
import 'package:bilaw_waye/screens/Auth/login.dart';
import 'package:bilaw_waye/screens/Cilent/account/user.dart';
import 'package:bilaw_waye/screens/Cilent/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: ((context) => Userprovider()))],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserServices userServices = UserServices();

  @override
  void initState() {
    userServices.getUserProfile(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: Provider.of<Userprovider>(context).user.token.isNotEmpty &&
        //         Provider.of<Userprovider>(context).user.isAdmin == false
        //     ? homeScreen()
        //     : Provider.of<Userprovider>(context).user.token.isNotEmpty &&
        //             Provider.of<Userprovider>(context).user.isAdmin == true
        //         ? adminScreen()
        //         : loginScreen()
        home: AccountScreen(),
                
                );
  }
}
