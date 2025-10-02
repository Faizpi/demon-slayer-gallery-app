import 'package:flutter/material.dart';
import '../models/character_model.dart';
import '../utils/responsive.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > mobileBreakpoint) {
          return _buildWideLayout(context);
        }
        return _buildMobileLayout(context);
      },
    );
  }

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

  Widget _buildWideLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        actions: _buildAppBarActions(context, isMobile: false),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 4,
            child: HeroBackground(
              imageUrl: character.imageUrl,
              heroTag: character.id,
            ),
          ),
          Expanded(
            flex: 6,
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

  List<Widget> _buildAppBarActions(
    BuildContext context, {
    required bool isMobile,
  }) {
    final iconColor = isMobile
        ? Colors.white
        : Theme.of(context).colorScheme.onSurface;

    return [
      IconButton(
        icon: Icon(Icons.share, color: iconColor),
        onPressed: () => _showShareOptions(context),
      ),
    ];
  }
}
