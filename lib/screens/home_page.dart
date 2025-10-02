import 'package:flutter/material.dart';
import '../models/character_model.dart';
import '../widgets/empty_state.dart';
import '../widgets/favorites_sheet.dart';
import '../widgets/search_text_field.dart';
import '../widgets/carousel_view.dart' as my_widgets;
import '../utils/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showSearch = false;
  String _query = '';
  final Set<String> _favorites = {};

  List<Character> get filtered => demoCharacters
      .where((c) => c.name.toLowerCase().contains(_query.toLowerCase()))
      .toList();

  void _toggleFavorite(String id) {
    setState(() {
      if (_favorites.contains(id)) {
        _favorites.remove(id);
      } else {
        _favorites.add(id);
      }
    });
  }

  void _showFavorites() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FavoritesSheet(
        favorites: _favorites,
        onToggleFavorite: _toggleFavorite,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withAlpha(204),
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Kimetsu no Yaiba',
          style: TextStyle(
            fontFamily: 'MochiyPop',
            color: Colors.black87,
            fontSize: 22,
          ),
        ),
        actions: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _favorites.isNotEmpty
                ? IconButton(
                    key: const ValueKey('fav_icon_button'),
                    icon: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Icon(Icons.favorite),
                        Positioned(
                          right: -4,
                          top: -4,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 14,
                              minHeight: 14,
                            ),
                            child: Text(
                              '${_favorites.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: _showFavorites,
                  )
                : const SizedBox.shrink(),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, anim) =>
                ScaleTransition(scale: anim, child: child),
            child: _showSearch
                ? SearchTextField(
                    key: const ValueKey('searchField'),
                    onChanged: (v) => setState(() => _query = v),
                    onClose: () => setState(() {
                      _showSearch = false;
                      _query = '';
                    }),
                  )
                : IconButton(
                    key: const ValueKey('searchIcon'),
                    icon: const Icon(Icons.search),
                    onPressed: () => setState(() => _showSearch = true),
                  ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 1.0,
              child: Image.asset(
                'assets/bg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile(context) ? 20.0 : 40.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '鬼滅の刃',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontFamily: 'MochiyPop',
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.black87,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: filtered.isEmpty
                        ? EmptyState(
                            key: const ValueKey('empty_state'),
                            query: _query,
                          )
                        : my_widgets.CarouselView(
                            key: const ValueKey('carousel_view'),
                            characters: filtered,
                            favorites: _favorites,
                            onToggleFavorite: _toggleFavorite,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _query.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () => setState(() => _query = ''),
              icon: const Icon(Icons.clear_all),
              label: const Text('Reset'),
            )
          : null,
    );
  }
}