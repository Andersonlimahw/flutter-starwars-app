import 'dart:convert';

class UserModel {
  int? id;
  final String name;
  final String email;
  final String nickName;
  final String image;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.nickName,
    required this.image,
  });
  

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? nickName,
    String? image,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      nickName: nickName ?? this.nickName,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'nickName': nickName,
      'image': image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      nickName: map['nickName'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, nickName: $nickName, image: $image)';
  }

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.nickName == nickName &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      nickName.hashCode ^
      image.hashCode;
  }

  static String generateCreateTable() {
    return 'CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT, email TEXT, nickName TEXT, image TEXT)';
  }
}
