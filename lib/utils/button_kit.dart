import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;

  CircularIconButton({super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.purple,
      ),
      child: IconButton(
        icon: icon,
        iconSize: 40.0,
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}
