// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: camel_case_types
class iconwidget extends StatelessWidget {
 final Color color;  
 final IconData icon;

  const iconwidget({
    Key? key,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration:
           BoxDecoration(shape: BoxShape.circle, color: color),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
