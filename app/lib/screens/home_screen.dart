// FILE: lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../services/item_service.dart';
import '../services/auth_service.dart';
import '../services/favorite_service.dart';
import 'product_page_screen.dart';
import 'add_listing_screen.dart';
import 'profile_screen.dart';
import 'edit_item_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ItemService _itemService = ItemService();
  final AuthService _authService = AuthService();
  final FavoriteService _favoriteService = FavoriteService();
  
  int _currentIndex = 0;
  int _activeCategoryIndex = 0;
  
  List<ItemModel> _allItems = [];
  List<ItemModel> _displayedItems = [];
  bool _isLoading = true;
  
  final TextEditingController _searchController = TextEditingController();
  
  final List<String> _categories = [
    "Games",
    "Consoles",
    "Accessories",
    "Electronics",
    "All"
  ];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadItems() async {
    setState(() => _isLoading = true);
    
    try {
      _allItems = await _itemService.getAllItems();
      _filterItems();
    } catch (e) {
      print('Error loading items: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _filterItems() {
    setState(() {
      if (_activeCategoryIndex == _categories.length - 1) {
        // "All" category
        _displayedItems = _allItems;
      } else {
        final category = _categories[_activeCategoryIndex];
        _displayedItems = _allItems
            .where((item) => 
                item.category?.toLowerCase() == category.toLowerCase())
            .toList();
      }
      
      // Apply search filter if there's a query
      if (_searchController.text.isNotEmpty) {
        _searchItems(_searchController.text);
      }
    });
  }

  void _searchItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filterItems();
      } else {
        _displayedItems = _allItems
            .where((item) =>
                item.title.toLowerCase().contains(query.toLowerCase()) ||
                (item.description?.toLowerCase().contains(query.toLowerCase()) ?? false))
            .toList();
      }
    });
  }

  Future<void> _toggleFavorite(int itemId) async {
    final userId = int.tryParse(_authService.getUserId() ?? '0') ?? 1;
    await _favoriteService.toggleFavorite(userId, itemId);
    
    // Show feedback
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Favorite updated'),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _currentIndex == 0 
          ? _buildHomeContent() 
          : _currentIndex == 1
              ? AddListingScreen()
              : ProfileScreen(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHomeContent() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 10),
          _buildHeader(),
          const SizedBox(height: 20),
          _buildSearchField(),
          const SizedBox(height: 20),
          _buildCategoryRow(),
          const SizedBox(height: 25),
          _isLoading ? _buildLoadingGrid() : _buildItemsGrid(),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.videogame_asset,
          color: Color(0xFF9C4DFF),
          size: 28,
        ),
        SizedBox(width: 8),
        Text(
          'RePlay',
          style: TextStyle(
            color: Color(0xFF9C4DFF),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.white, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              onChanged: _searchItems,
              decoration: const InputDecoration(
                hintText: "Search for games or accessories...",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryRow() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final isActive = _activeCategoryIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() => _activeCategoryIndex = index);
              _filterItems();
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFF9C4DFF) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isActive ? const Color(0xFF9C4DFF) : Colors.white,
                ),
              ),
              child: Center(
                child: Text(
                  _categories[index],
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (ctx, i) => Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Center(
          child: CircularProgressIndicator(color: Color(0xFF9C4DFF)),
        ),
      ),
    );
  }

  Widget _buildItemsGrid() {
    if (_displayedItems.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Icon(
                Icons.search_off,
                size: 64,
                color: Colors.grey[700],
              ),
              const SizedBox(height: 16),
              Text(
                'No items found',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Try a different search or category',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _displayedItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (ctx, i) => _buildItemCard(_displayedItems[i]),
    );
  }

  Widget _buildItemCard(ItemModel item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Productpage(item: item),
          ),
        ).then((_) => _loadItems()); // Reload after returning
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItemImage(item),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    _buildPriceTag(item),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTypeBadge(item.type ?? 'sell'),
                        Row(children: [
                          _buildFavoriteButton(item.itemId!),
                          const SizedBox(width: 8),
                          if (_isOwner(item)) _buildEditButton(item),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isOwner(ItemModel item) {
    // Attempt to compare current auth user id (string/uuid) with item.userId (int)
    final currentUserId = int.tryParse(_authService.getUserId() ?? '');
    return currentUserId != null && currentUserId == item.userId;
  }

  Widget _buildEditButton(ItemModel item) {
    return GestureDetector(
      onTap: () async {
        // Navigate to edit screen and refresh on return
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditItemScreen(
              item: item,
              onItemUpdated: (updated) {
                // Update local list quickly
                final idx = _allItems.indexWhere((it) => it.itemId == updated.itemId);
                if (idx != -1) {
                  _allItems[idx] = updated;
                  _filterItems();
                }
              },
            ),
          ),
        );
        // Ensure server state fetched
        _loadItems();
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  Widget _buildItemImage(ItemModel item) {
    return Stack(
      children: [
        Container(
          height: 140,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            image: DecorationImage(
              image: NetworkImage(
                item.imageUrl ?? 'https://via.placeholder.com/300',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (!item.status)
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
              color: Colors.black.withOpacity(0.5),
            ),
            child: const Center(
              child: Text(
                'UNAVAILABLE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPriceTag(ItemModel item) {
    String priceText;
    if (item.type == 'rent') {
      priceText = '\$${item.price ?? 0}/day';
    } else if (item.type == 'trade') {
      priceText = 'Trade';
    } else {
      priceText = '\$${item.price ?? 0}';
    }

    return Text(
      priceText,
      style: const TextStyle(
        color: Color(0xFF9C4DFF),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _buildTypeBadge(String type) {
    Color color;
    String label;
    
    if (type == 'rent') {
      color = Colors.blueAccent;
      label = 'Rent';
    } else if (type == 'trade') {
      color = Colors.purpleAccent;
      label = 'Trade';
    } else {
      color = Colors.green;
      label = 'Sell';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }

  Widget _buildFavoriteButton(int itemId) {
    return GestureDetector(
      onTap: () => _toggleFavorite(itemId),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: Colors.transparent,
        selectedItemColor: const Color(0xFF9C4DFF),
        unselectedItemColor: Colors.grey,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}