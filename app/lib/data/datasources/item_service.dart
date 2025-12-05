import '../models/item_model.dart';
import 'supabase_service.dart';

class ItemService {
  final _supabase = SupabaseService.client;

  // CREATE - Add new item
  Future<ItemModel?> createItem(ItemModel item) async {
    try {
      final response = await _supabase
          .from('items')
          .insert(item.toJson())
          .select()
          .single();

      return ItemModel.fromJson(response);
    } catch (e) {
      print('Error creating item: $e');
      return null;
    }
  }

  // READ - Get all items
  Future<List<ItemModel>> getAllItems() async {
    try {
      final response = await _supabase
          .from('items')
          .select()
          .order('datecreated', ascending: false);

      return (response as List)
          .map((json) => ItemModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Error fetching items: $e');
      return [];
    }
  }

  // READ - Get item by ID
  Future<ItemModel?> getItemById(int itemId) async {
    try {
      final response = await _supabase
          .from('items')
          .select()
          .eq('itemid', itemId)
          .single();

      return ItemModel.fromJson(response);
    } catch (e) {
      print('Error fetching item: $e');
      return null;
    }
  }

  // READ - Get items by user
  Future<List<ItemModel>> getItemsByUser(int userId) async {
    try {
      print('Fetching items for userId: $userId'); // Debug
      final response = await _supabase
          .from('items')
          .select()
          .eq('userid', userId)
          .order('datecreated', ascending: false);

      print('Raw response: $response'); // Debug
      final items = (response as List)
          .map((json) => ItemModel.fromJson(json))
          .toList();
      print('Parsed ${items.length} items for user $userId'); // Debug
      return items;
    } catch (e) {
      print('Error fetching user items: $e');
      return [];
    }
  }

  // READ - Get items by type (sell, trade, rent)
  Future<List<ItemModel>> getItemsByType(String type) async {
    try {
      final response = await _supabase
          .from('items')
          .select()
          .eq('type', type)
          .eq('status', true)
          .order('datecreated', ascending: false);

      return (response as List)
          .map((json) => ItemModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Error fetching items by type: $e');
      return [];
    }
  }

  // READ - Get items by category
  Future<List<ItemModel>> getItemsByCategory(String category) async {
    try {
      final response = await _supabase
          .from('items')
          .select()
          .eq('category', category)
          .eq('status', true)
          .order('datecreated', ascending: false);

      return (response as List)
          .map((json) => ItemModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Error fetching items by category: $e');
      return [];
    }
  }

  // READ - Search items by title
  Future<List<ItemModel>> searchItems(String query) async {
    try {
      final response = await _supabase
          .from('items')
          .select()
          .ilike('title', '%$query%')
          .eq('status', true)
          .order('datecreated', ascending: false);

      return (response as List)
          .map((json) => ItemModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Error searching items: $e');
      return [];
    }
  }

  // UPDATE - Update item
  Future<bool> updateItem(int itemId, Map<String, dynamic> updates) async {
    try {
      await _supabase.from('items').update(updates).eq('itemid', itemId);

      return true;
    } catch (e) {
      print('Error updating item: $e');
      return false;
    }
  }

  // UPDATE - Toggle item status
  Future<bool> toggleItemStatus(int itemId, bool newStatus) async {
    try {
      await _supabase
          .from('items')
          .update({'status': newStatus})
          .eq('itemid', itemId);

      return true;
    } catch (e) {
      print('Error toggling item status: $e');
      return false;
    }
  }

  // DELETE - Delete item
  Future<bool> deleteItem(int itemId) async {
    try {
      await _supabase.from('items').delete().eq('itemid', itemId);

      return true;
    } catch (e) {
      print('Error deleting item: $e');
      return false;
    }
  }
}
