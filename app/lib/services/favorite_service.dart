import '../models/favorite_item_model.dart';
import '../models/item_model.dart';
import 'supabase_service.dart';

class FavoriteService {
  final _supabase = SupabaseService.client;

  // CREATE - Add item to favorites
  Future<bool> addToFavorites(int userId, int itemId) async {
    try {
      await _supabase.from('favorite_item').insert({
        'userid': userId,
        'itemid': itemId,
      });
      
      return true;
    } catch (e) {
      print('Error adding to favorites: $e');
      return false;
    }
  }

  // READ - Get all favorite items for a user
  Future<List<ItemModel>> getUserFavorites(int userId) async {
    try {
      final response = await _supabase
          .from('favorite_item')
          .select('itemid, items(*)')
          .eq('userid', userId);
      
      return (response as List)
          .map((json) => ItemModel.fromJson(json['items']))
          .toList();
    } catch (e) {
      print('Error fetching favorites: $e');
      return [];
    }
  }

  // READ - Check if item is favorited by user
  Future<bool> isFavorited(int userId, int itemId) async {
    try {
      final response = await _supabase
          .from('favorite_item')
          .select()
          .eq('userid', userId)
          .eq('itemid', itemId)
          .maybeSingle();
      
      return response != null;
    } catch (e) {
      print('Error checking favorite: $e');
      return false;
    }
  }

  // DELETE - Remove from favorites
  Future<bool> removeFromFavorites(int userId, int itemId) async {
    try {
      await _supabase
          .from('favorite_item')
          .delete()
          .eq('userid', userId)
          .eq('itemid', itemId);
      
      return true;
    } catch (e) {
      print('Error removing from favorites: $e');
      return false;
    }
  }

  // TOGGLE - Add or remove from favorites
  Future<bool> toggleFavorite(int userId, int itemId) async {
    final isFav = await isFavorited(userId, itemId);
    
    if (isFav) {
      return await removeFromFavorites(userId, itemId);
    } else {
      return await addToFavorites(userId, itemId);
    }
  }
}
