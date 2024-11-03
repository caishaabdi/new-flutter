import 'package:bilaw_waye/provider/user_provider.dart';
import 'package:bilaw_waye/screens/Auth/APIs/UserServices.dart';
import 'package:bilaw_waye/screens/Cilent/account/Widget/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<Userprovider>(listen: false, context).user;
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const SizedBox(height: 20),
        ListTile(
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.all(0),
          leading: Container(
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            child: const CircleAvatar(radius: 30, child: Icon(Icons.person)),
          ),
          title:  Text(user.name),
          subtitle:  Text(user.email),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        const SizedBox(height: 20),
        ListTile(
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.all(0),
          leading: Container(
            padding: const EdgeInsets.all(6),
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          title: const Text('Dark mode'),
          trailing: const Icon(Icons.light_mode),
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        const Text('GENERAL'),
        const ListTile(
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.all(0),
          leading: iconwidget(
              color: Color.fromARGB(255, 11, 111, 251), icon: Icons.person),
          title: Text('Account Setting'),
          subtitle: Text('change your profile info'),

          trailing: Icon(Icons.arrow_forward_ios),
        ),
        const ListTile(
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.all(0),
          leading: iconwidget(
              color: Color.fromARGB(255, 14, 249, 85), icon: Icons.password),
          title: Text('Change Password'),
          subtitle: Text('update your password'),

          trailing: Icon(Icons.arrow_forward_ios),
        ),
        const ListTile(
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.all(0),
          leading: iconwidget(
              color: Color.fromARGB(255, 246, 32, 196), icon: Icons.receipt),
          title: Text('My Orders'),
          subtitle: Text('your order History'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
         ListTile(
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.all(0),
          leading: iconwidget(
              color: Color.fromARGB(255, 218, 15, 237), icon: Icons.logout),
          title: Text('LogOut'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: (() => UserServices().logOut(context)),
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        const Text('FeedBack'),
        const ListTile(
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.all(0),
          leading: iconwidget(
              color: Color.fromARGB(255, 49, 240, 160), icon: Icons.call),
          title: Text('Call Us'),
        ),
        const ListTile(
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.all(0),
          leading: iconwidget(
              color: Color.fromARGB(255, 246, 161, 16), icon: Icons.info),
          title: Text('About Xaliye'),
        ),
        const ListTile(
          // ignore: prefer_const_constructors
          contentPadding: EdgeInsets.all(0),
          leading: iconwidget(
              color: Color.fromARGB(255, 49, 240, 160), icon: Icons.web),
          title: Text('Vist Website'),
        ),
      ],
    ));
  }
}
