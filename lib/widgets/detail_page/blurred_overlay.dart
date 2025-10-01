// lib/widgets/detail_page/blurred_overlay.dart
import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        color: Colors.black.withOpacity(0.3),
      ),
    );
  }
}