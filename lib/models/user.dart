import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String name;
  final String email;
  final String address;
  final int phone;
  final bool isAdmin;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.isAdmin,
    required this.token,

  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
      'isAdmin': isAdmin,
      'token': token,

    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ??'',
      address: map['address'] ?? '',
      phone: map['phone'] ?? 0,
      token: map['token']  ??'',
      isAdmin: map['isAdmin'] ?? false


    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? address,
    int? phone,
    String? token,
    bool? isAdmin,

  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      isAdmin: isAdmin ?? this.isAdmin ,
      token: token ?? this.token,
    );
  }
}
