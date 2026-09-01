import 'dart:ui';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  const BaseScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Image.asset('assets/streaming_wall.png', fit: BoxFit.cover),
          ),
        ),
        child,
      ],
    );
  }
}
