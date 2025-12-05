class ItemModel {
  final int? itemId;
  final String? imageUrl;
  final String title;
  final String? description;
  final String? type; // 'sell', 'trade', 'rent'
  final String? category;
  final String? platform;
  final int? price;
  final int userId;
  final bool status;
  final DateTime? dateCreated;

  ItemModel({
    this.itemId,
    this.imageUrl,
    required this.title,
    this.description,
    this.type,
    this.category,
    this.platform,
    this.price,
    required this.userId,
    this.status = true,
    this.dateCreated,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      itemId: json['itemid'],
      imageUrl: json['imageurl'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
      category: json['category'],
      platform: json['platform'],
      price: json['price'],
      userId: json['userid'],
      status: json['status'] ?? true,
      dateCreated: json['datecreated'] != null 
          ? DateTime.parse(json['datecreated']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (itemId != null) 'itemid': itemId,
      if (imageUrl != null) 'imageurl': imageUrl,
      'title': title,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (category != null) 'category': category,
      if (platform != null) 'platform': platform,
      if (price != null) 'price': price,
      'userid': userId,
      'status': status,
    };
  }
}