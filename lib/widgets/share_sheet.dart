import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShareSheet extends StatelessWidget {
  final String characterName;

  const ShareSheet({super.key, required this.characterName});

  @override
  Widget build(BuildContext context) {
    final shareOptions = [
      {'name': 'WhatsApp', 'icon': Icons.chat_bubble, 'color': Colors.green},
      {'name': 'Telegram', 'icon': Icons.telegram, 'color': Colors.lightBlue},
      {'name': 'Instagram', 'icon': Icons.camera_alt, 'color': Colors.purple},
      {'name': 'TikTok', 'icon': Icons.music_note, 'color': Colors.black},
      {'name': 'Twitter', 'icon': Icons.alternate_email, 'color': Colors.blue},
      {'name': 'Facebook', 'icon': Icons.facebook, 'color': Colors.blue[900]},
      {'name': 'Pinterest', 'icon': Icons.push_pin, 'color': Colors.red},
      {'name': 'Email', 'icon': Icons.email, 'color': Colors.orange[800]},
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
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
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: Wrap(
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
