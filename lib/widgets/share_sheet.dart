// lib/widgets/share_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShareSheet extends StatelessWidget {
  final String characterName;

  const ShareSheet({super.key, required this.characterName});

  @override
  Widget build(BuildContext context) {
    final shareOptions = [
      {'name': 'WhatsApp', 'icon': Icons.chat, 'color': Colors.green},
      {'name': 'Instagram', 'icon': Icons.camera_alt, 'color': Colors.purple},
      {'name': 'TikTok', 'icon': Icons.music_note, 'color': Colors.black},
      {'name': 'Twitter', 'icon': Icons.alternate_email, 'color': Colors.blue},
      {'name': 'Facebook', 'icon': Icons.facebook, 'color': Colors.blue[900]},
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      // ▼▼▼ BUNGKUS DENGAN SingleChildScrollView ▼▼▼
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Share to',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                0,
                16,
                24,
              ), // Tambah padding bawah
              child: Wrap(
                // Gunakan Wrap agar lebih fleksibel di layar kecil
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: shareOptions.map((option) {
                  return GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Share $characterName to ${option['name']}',
                          ),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: (option['color'] as Color).withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            option['icon'] as IconData,
                            color: option['color'] as Color,
                            size: 32,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          option['name'] as String,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
