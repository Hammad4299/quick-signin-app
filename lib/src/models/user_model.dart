class UserModel {
  final int userId;
  final String fullName;
  final String email;

  UserModel({
    required this.userId,
    required this.fullName,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      fullName: json['fullName'],
      email: json['email'],
    );
  }
}