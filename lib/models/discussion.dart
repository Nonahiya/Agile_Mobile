import 'dart:convert';

import 'package:equatable/equatable.dart';

class Discussion extends Equatable {
  final String? id;
  final String? leaderId;
  final String? title;
  final String? description;
  final String? zoomLink;
  final String? date;
  final String? createdAt;
  final String? updatedAt;

  const Discussion({
    this.id,
    this.leaderId,
    this.title,
    this.description,
    this.zoomLink,
    this.date,
    this.createdAt,
    this.updatedAt,
  });

  factory Discussion.fromMap(Map<String, dynamic> data) => Discussion(
        id: data['id'] as String?,
        leaderId: data['leader_id'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        zoomLink: data['zoom_link '] as String?,
        date: data['date '] as String?,
        createdAt: data['created_at '] as String?,
        updatedAt: data['updated_at '] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'leader_id': leaderId,
        'title': title,
        'description': description,
        'zoom_link ': zoomLink,
        'date ': date,
        'created_at ': createdAt,
        'updated_at ': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Discussion].
  factory Discussion.fromJson(String data) {
    return Discussion.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Discussion] to a JSON string.
  String toJson() => json.encode(toMap());

  Discussion copyWith({
    String? id,
    String? leaderId,
    String? title,
    String? description,
    String? zoomLink,
    String? date,
    String? createdAt,
    String? updatedAt,
  }) {
    return Discussion(
      id: id ?? this.id,
      leaderId: leaderId ?? this.leaderId,
      title: title ?? this.title,
      description: description ?? this.description,
      zoomLink: zoomLink ?? this.zoomLink,
      date: date ?? this.date,
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
      leaderId,
      title,
      description,
      zoomLink,
      date,
      createdAt,
      updatedAt,
    ];
  }
}
