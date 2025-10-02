import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final Function(String) onChanged;
  final VoidCallback onClose;

  const SearchTextField({
    super.key,
    required this.onChanged,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 200,
        child: TextField(
          autofocus: true,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Cari karakter...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.close),
              onPressed: onClose,
            ),
          ),
          style: const TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
