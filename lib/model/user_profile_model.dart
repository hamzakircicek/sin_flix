class UserModel {
  String id;
  String? token;
  String name;
  String email;
  String photoUrl;

  static UserModel? _instance;

  UserModel._internal({
    required this.id,
    this.token,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  static UserModel get instance {
    if (_instance != null) {
      return _instance!;
    }
    throw Exception('UserModel is not initialized');
  }

  static void clear() {
    _instance = null;
  }

  factory UserModel.fromJson(Map<String, dynamic> toMap) {
    return _instance = UserModel._internal(
      token: toMap['token'],
      id: toMap['id'],
      name: toMap['name'],
      email: toMap['email'],
      photoUrl: toMap['photoUrl'],
    );
  }
}
