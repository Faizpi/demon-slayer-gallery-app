// lib/screens/detail_page.dart
import 'package:flutter/material.dart';
import '../models/character_model.dart';
import '../utils/responsive.dart'; // <-- IMPORT HELPER KITA
import '../widgets/detail_page/blurred_overlay.dart';
import '../widgets/detail_page/detail_content_card.dart';
import '../widgets/detail_page/hero_background.dart';
import '../widgets/share_sheet.dart';

class DetailPage extends StatelessWidget {
  final Character character;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const DetailPage({
    super.key,
    required this.character,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  void _showShareOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ShareSheet(characterName: character.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder akan memantau ukuran yang tersedia untuk widget ini
    return LayoutBuilder(
      builder: (context, constraints) {
        // Jika lebar layar lebih besar dari breakpoint mobile,
        // tampilkan layout untuk layar lebar (master-detail).
        if (constraints.maxWidth > mobileBreakpoint) {
          return _buildWideLayout(context);
        }
        // Jika tidak, tampilkan layout mobile seperti semula.
        return _buildMobileLayout(context);
      },
    );
  }

  /// TATA LETAK UNTUK MOBILE (KODE LAMA ANDA)
  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: _buildAppBarActions(context, isMobile: true),
      ),
      body: Stack(
        children: [
          HeroBackground(imageUrl: character.imageUrl, heroTag: character.id),
          BlurredOverlay(),
          DetailContentCard(character: character),
        ],
      ),
    );
  }

  /// TATA LETAK BARU UNTUK TABLET & WEB
  Widget _buildWideLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        actions: _buildAppBarActions(context, isMobile: false),
      ),
      body: Row(
        children: [
          // Sisi Kiri: Gambar Karakter
          Expanded(
            flex: 4, // Alokasikan 40% ruang untuk gambar
            child: HeroBackground(
              imageUrl: character.imageUrl,
              heroTag: character.id,
            ),
          ),
          // Sisi Kanan: Detail Konten
          Expanded(
            flex: 6, // Alokasikan 60% ruang untuk detail
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Chip(
                    label: Text(character.role),
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.secondaryContainer,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    character.description,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(height: 1.6, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Helper untuk membangun tombol di AppBar agar tidak duplikat kode
  List<Widget> _buildAppBarActions(
    BuildContext context, {
    required bool isMobile,
  }) {
    final iconColor = isMobile
        ? Colors.white
        : Theme.of(context).colorScheme.onSurface;

    return [
      // IconButton(
      //   icon: AnimatedSwitcher(
      //     duration: const Duration(milliseconds: 300),
      //     child: Icon(
      //       isFavorite ? Icons.favorite : Icons.favorite_border,
      //       key: ValueKey(isFavorite),
      //       color: isFavorite ? Colors.red : iconColor,
      //     ),
      //   ),
      //   onPressed: onFavoriteToggle,
      // ),
      IconButton(
        icon: Icon(Icons.share, color: iconColor),
        onPressed: () => _showShareOptions(context),
      ),
    ];
  }
}
