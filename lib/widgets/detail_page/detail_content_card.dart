// lib/widgets/detail_page/detail_content_card.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../models/character_model.dart';

class DetailContentCard extends StatelessWidget {
  final Character character;

  const DetailContentCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                padding: const EdgeInsets.all(24),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CharacterName(name: character.name),
                    const SizedBox(height: 8),
                    _RoleBadge(role: character.role),
                    const SizedBox(height: 16),
                    _CharacterDescription(description: character.description),
                    const SizedBox(height: 24),
                    _InfoChipRow(character: character),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ... (Sub-widget lain tidak berubah)
class _CharacterName extends StatelessWidget {
  final String name;
  const _CharacterName({required this.name});
  @override
  Widget build(BuildContext context) {
    return Text(name,
        style: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white));
  }
}

class _RoleBadge extends StatelessWidget {
  final String role;
  const _RoleBadge({required this.role});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20)),
        child: Text(role,
            style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500)));
  }
}

class _CharacterDescription extends StatelessWidget {
  final String description;
  const _CharacterDescription({required this.description});
  @override
  Widget build(BuildContext context) {
    return Text(description,
        style:
            const TextStyle(color: Colors.white, fontSize: 15, height: 1.5));
  }
}


class _InfoChipRow extends StatelessWidget {
  final Character character;
  const _InfoChipRow({required this.character});

  @override
  Widget build(BuildContext context) {
    final List<Widget> chips = [];

    if (character.id.startsWith('t')) {
      chips.add(const _InfoChip(icon: Icons.shield, label: 'Slayer Corps'));
    } else if (character.id.startsWith('d')) {
      chips.add(const _InfoChip(icon: Icons.flare, label: 'Demon'));
    }
    
    if (character.role.contains('Pillar') || character.role.contains('Hashira')) {
      chips.add(const _InfoChip(icon: Icons.military_tech, label: 'Hashira Rank'));
    } else if (character.role.contains('Upper Rank')) {
      chips.add(const _InfoChip(icon: Icons.star, label: 'Upper Rank'));
    }

    // ▼▼▼ LOGIKA BARU: Khusus untuk Muzan ▼▼▼
    // ID 'mzn' adalah ID untuk Muzan Kibutsuji
    if (character.id == 'mzn') {
      chips.add(const _InfoChip(icon: Icons.workspace_premium, label: 'Demon King'));
    }

    return Wrap(spacing: 8, runSpacing: 8, children: chips);
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoChip({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(color: Colors.white.withOpacity(0.3), width: 1)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 16, color: Colors.white),
          const SizedBox(width: 6),
          Text(label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500))
        ]));
  }
}