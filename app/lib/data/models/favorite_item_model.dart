class FavoriteItemModel {
  final int userId;
  final int itemId;

  FavoriteItemModel({
    required this.userId,
    required this.itemId,
  });

  factory FavoriteItemModel.fromJson(Map<String, dynamic> json) {
    return FavoriteItemModel(
      userId: json['userid'],
      itemId: json['itemid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userid': userId,
      'itemid': itemId,
    };
  }
}