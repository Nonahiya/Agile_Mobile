import 'dart:convert';

import 'package:equatable/equatable.dart';

class Reminder extends Equatable {
  final String? id;
  final String? leaderId;
  final String? content;
  final String? date;
  final String? createdAt;
  final String? updatedAt;

  const Reminder({
    this.id,
    this.leaderId,
    this.content,
    this.date,
    this.createdAt,
    this.updatedAt,
  });

  factory Reminder.fromMap(Map<String, dynamic> data) => Reminder(
        id: data['id'] as String?,
        leaderId: data['leader_id'] as String?,
        content: data['content'] as String?,
        date: data['date'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'leader_id': leaderId,
        'content': content,
        'date': date,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Reminder].
  factory Reminder.fromJson(String data) {
    return Reminder.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Reminder] to a JSON string.
  String toJson() => json.encode(toMap());

  Reminder copyWith({
    String? id,
    String? leaderId,
    String? content,
    String? date,
    String? createdAt,
    String? updatedAt,
  }) {
    return Reminder(
      id: id ?? this.id,
      leaderId: leaderId ?? this.leaderId,
      content: content ?? this.content,
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
      content,
      date,
      createdAt,
      updatedAt,
    ];
  }
}
