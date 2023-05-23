part of 'models.dart';

class User extends Equatable {
  final String? id;
  final String? email;
  final String? password;
  final String? name;
  final String? gender;
  final String? city;
  final String? birthdate;
  final String? phone;
  final String? role;
  final String? createdAt;
  final String? updatedAt;

  const User({
    this.id,
    this.email,
    this.password,
    this.name,
    this.gender,
    this.city,
    this.birthdate,
    this.phone,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as String?,
        email: data['email'] as String?,
        password: data['password'] as String?,
        name: data['name'] as String?,
        gender: data['gender'] as String?,
        city: data['city'] as String?,
        birthdate: data['birthdate'] as String?,
        phone: data['phone'] as String?,
        role: data['role'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'email': email,
        'password': password,
        'name': name,
        'gender': gender,
        'city': city,
        'birthdate': birthdate,
        'phone': phone,
        'role': role,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  User copyWith({
    String? id,
    String? email,
    String? password,
    String? name,
    String? gender,
    String? city,
    String? birthdate,
    String? phone,
    String? role,
    String? createdAt,
    String? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      birthdate: birthdate ?? this.birthdate,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      email,
      password,
      name,
      gender,
      city,
      birthdate,
      phone,
      role,
      createdAt,
      updatedAt,
    ];
  }
}
