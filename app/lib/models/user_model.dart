class UserModel {
  final int? userId;
  final String userName;
  final String email;
  final int? phoneNum;
  final String password;
  final String? imageUrl;
  final bool isAdmin;
  final DateTime? dateCreated;

  UserModel({
    this.userId,
    required this.userName,
    required this.email,
    this.phoneNum,
    required this.password,
    this.imageUrl,
    this.isAdmin = false,
    this.dateCreated,
  });

  // From JSON (from Supabase)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userid'],
      userName: json['username'],
      email: json['email'],
      phoneNum: json['phonenum'],
      password: json['password'],
      imageUrl: json['imageurl'],
      isAdmin: json['isadmin'] ?? false,
      dateCreated: json['datecreated'] != null 
          ? DateTime.parse(json['datecreated']) 
          : null,
    );
  }

  // To JSON (for Supabase)
  Map<String, dynamic> toJson() {
    return {
      if (userId != null) 'userid': userId,
      'username': userName,
      'email': email,
      if (phoneNum != null) 'phonenum': phoneNum,
      'password': password,
      if (imageUrl != null) 'imageurl': imageUrl,
      'isadmin': isAdmin,
    };
  }
}
