import 'dart:convert';

import 'package:equatable/equatable.dart';

class Materials extends Equatable {
  final String? id;
  final String? userId;
  final String? title;
  final String? content;
  final String? createdAt;
  final String? updatedAt;

  const Materials({
    this.id,
    this.userId,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory Materials.fromMap(Map<String, dynamic> data) => Materials(
        id: data['id'] as String?,
        userId: data['user_id'] as String?,
        title: data['title'] as String?,
        content: data['content'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_id': userId,
        'title': title,
        'content': content,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Materials].
  factory Materials.fromJson(String data) {
    return Materials.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Materials] to a JSON string.
  String toJson() => json.encode(toMap());

  Materials copyWith({
    String? id,
    String? userId,
    String? title,
    String? content,
    String? createdAt,
    String? updatedAt,
  }) {
    return Materials(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      content: content ?? this.content,
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
      userId,
      title,
      content,
      createdAt,
      updatedAt,
    ];
  }
}
