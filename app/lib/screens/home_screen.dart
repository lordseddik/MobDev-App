import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/item_model.dart';
import '../services/user_service.dart';
import '../services/item_service.dart';
import '../services/favorite_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserService _userService = UserService();
  final ItemService _itemService = ItemService();
  final FavoriteService _favoriteService = FavoriteService();

  List<ItemModel> items = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  // Example: Load all items
  Future<void> _loadItems() async {
    setState(() => isLoading = true);
    items = await _itemService.getAllItems();
    setState(() => isLoading = false);
  }

  // Example: Create a new user
  Future<void> _createUser() async {
    final newUser = UserModel(
      userName: 'John Doe',
      email: 'john${DateTime.now().millisecondsSinceEpoch}@example.com',
      password: 'password123',
      phoneNum: 1234567890,
    );

    final createdUser = await _userService.createUser(newUser);
    if (createdUser != null) {
      print('User created: ${createdUser.userName}');
    }
  }

  // Example: Create a new item
  Future<void> _createItem() async {
    final newItem = ItemModel(
      title: 'Gaming Laptop',
      description: 'High-performance gaming laptop',
      type: 'sell',
      category: 'Electronics',
      price: 1200,
      userId: 1, // Replace with actual user ID
      imageUrl: 'https://example.com/laptop.jpg',
    );

    final createdItem = await _itemService.createItem(newItem);
    if (createdItem != null) {
      print('Item created: ${createdItem.title}');
      _loadItems(); // Refresh list
    }
  }

  // Example: Update an item
  Future<void> _updateItem(int itemId) async {
    final success = await _itemService.updateItem(itemId, {
      'title': 'Updated Gaming Laptop',
      'price': 1000,
    });

    if (success) {
      print('Item updated');
      _loadItems(); // Refresh list
    }
  }

  // Example: Delete an item
  Future<void> _deleteItem(int itemId) async {
    final success = await _itemService.deleteItem(itemId);
    
    if (success) {
      print('Item deleted');
      _loadItems(); // Refresh list
    }
  }

  // Example: Toggle favorite
  Future<void> _toggleFavorite(int userId, int itemId) async {
    final success = await _favoriteService.toggleFavorite(userId, itemId);
    
    if (success) {
      print('Favorite toggled');
    }
  }

  // Example: Search items
  Future<void> _searchItems(String query) async {
    setState(() => isLoading = true);
    items = await _itemService.searchItems(query);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  leading: item.imageUrl != null
                      ? Image.network(item.imageUrl!, width: 50, height: 50)
                      : const Icon(Icons.image),
                  title: Text(item.title),
                  subtitle: Text('${item.type} - \$${item.price ?? 0}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () => _toggleFavorite(1, item.itemId!),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _updateItem(item.itemId!),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteItem(item.itemId!),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}