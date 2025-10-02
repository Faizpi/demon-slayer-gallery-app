import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredOverlay extends StatelessWidget {
  const BlurredOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(color: Colors.black.withOpacity(0.3)),
    );
  }
}
