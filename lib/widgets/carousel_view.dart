// lib/widgets/carousel_view.dart
import 'package:flutter/material.dart';
import '../models/character_model.dart';
import '../screens/detail_page.dart';
import '../utils/responsive.dart';
import 'carousel_card.dart';

class CarouselView extends StatefulWidget {
  final List<Character> characters;
  final Set<String> favorites;
  // ▼▼▼ PERBAIKI NAMA DI SINI ▼▼▼
  final Function(String) onToggleFavorite;

  const CarouselView({
    super.key,
    required this.characters,
    required this.favorites,
    // ▼▼▼ DAN DI SINI ▼▼▼
    required this.onToggleFavorite,
  });

  @override
  State<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends State<CarouselView> {
  PageController? _pageController;
  int _actualCurrentIndex = 0;

  @override
  void initState() {
    super.initState();
    // initState() sengaja dikosongkan.
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_pageController == null) {
      _initializeController();
    }
  }

  @override
  void didUpdateWidget(covariant CarouselView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.characters.length != oldWidget.characters.length) {
      _initializeController();
    }
  }

  void _initializeController() {
    if (widget.characters.isEmpty) return;

    final double viewFraction;
    if (isDesktop(context)) {
      viewFraction = 0.35;
    } else if (isTablet(context)) {
      viewFraction = 0.5;
    } else {
      viewFraction = 0.8;
    }

    int initialPage = 0;
    if (widget.characters.length > 3) {
      const int simulatedBaseIndex = 10000;
      initialPage =
          simulatedBaseIndex - (simulatedBaseIndex % widget.characters.length);
    }

    setState(() {
      _pageController?.dispose();
      _pageController = PageController(
        viewportFraction: viewFraction,
        initialPage: initialPage,
      );
      _actualCurrentIndex = 0;
    });
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_pageController == null || widget.characters.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    final bool useInfinityScroll = widget.characters.length > 3;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PageView.builder(
            key: ValueKey(widget.characters.length),
            controller: _pageController,
            itemCount: useInfinityScroll ? null : widget.characters.length,
            onPageChanged: (index) {
              setState(() {
                _actualCurrentIndex = useInfinityScroll
                    ? index % widget.characters.length
                    : index;
              });
            },
            itemBuilder: (context, index) {
              final actualIndex = useInfinityScroll
                  ? index % widget.characters.length
                  : index;

              if (actualIndex >= widget.characters.length)
                return const SizedBox.shrink();

              final character = widget.characters[actualIndex];
              final isFavorite = widget.favorites.contains(character.id);

              return AnimatedScale(
                scale: _actualCurrentIndex == actualIndex ? 1.0 : 0.9,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: CarouselCard(
                    character: character,
                    isFavorite: isFavorite,
                    // Pastikan di sini juga konsisten
                    onFavoriteToggle: () =>
                        widget.onToggleFavorite(character.id),
                    onTap: () => Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 700),
                        pageBuilder: (_, __, ___) => DetailPage(
                          character: character,
                          isFavorite: isFavorite,
                          onFavoriteToggle: () =>
                              widget.onToggleFavorite(character.id),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.characters.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _actualCurrentIndex == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _actualCurrentIndex == index
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
