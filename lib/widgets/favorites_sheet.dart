import 'package:flutter/material.dart';
import '../models/character_model.dart';
import '../utils/image_builder.dart';

class FavoritesSheet extends StatefulWidget {
  final Set<String> favorites;
  final Function(String) onToggleFavorite;

  const FavoritesSheet({
    super.key,
    required this.favorites,
    required this.onToggleFavorite,
  });

  @override
  State<FavoritesSheet> createState() => _FavoritesSheetState();
}

class _FavoritesSheetState extends State<FavoritesSheet> {
  late List<Character> _favoriteCharacters;

  @override
  void initState() {
    super.initState();
    _updateFavoritesList();
  }

  void _updateFavoritesList() {
    _favoriteCharacters = demoCharacters
        .where((c) => widget.favorites.contains(c.id))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.favorite, color: Colors.red),
                  const SizedBox(width: 8),
                  Text(
                    'Favorites (${_favoriteCharacters.length})', // Gunakan panjang list lokal
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _favoriteCharacters.isEmpty
                  ? const Center(
                      child: Text(
                        'Silahkan tambahkan favorit',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _favoriteCharacters.length,
                      itemBuilder: (context, index) {
                        final character = _favoriteCharacters[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: buildCharacterImage(character.imageUrl),
                            ),
                            title: Text(character.name),
                            subtitle: Text(character.role),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                widget.onToggleFavorite(character.id);
                                setState(() {
                                  _updateFavoritesList();
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
