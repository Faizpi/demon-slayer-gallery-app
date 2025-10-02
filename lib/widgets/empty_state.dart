import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String query;

  const EmptyState({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'Tidak ada hasil untuk "$query"',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
