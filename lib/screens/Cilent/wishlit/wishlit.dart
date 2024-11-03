import 'package:flutter/material.dart';

class WishlitScreen extends StatelessWidget {
  const WishlitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My wishlit'),
        backgroundColor: Color.fromARGB(255, 215, 208, 17),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}
