import 'package:flutter/material.dart';

Widget buildCharacterImage(String path) {
  if (path.startsWith('http')) {
    return Image.network(path, fit: BoxFit.cover);
  } else {
    return Image.asset(path, fit: BoxFit.cover);
  }
}
