import 'package:flutter/material.dart';
import 'package:morad_task_tracker/constants/color_palette.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final TextEditingController? controller;
  final void Function()? onSubmit;
  const MyTextField({
    required this.hintText,
    required this.icon,
    this.controller,
    this.onSubmit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorPalette().lightGrey,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: TextField(
          onEditingComplete: onSubmit,
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(
                icon,
                color: Colors.orange,
              ),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
