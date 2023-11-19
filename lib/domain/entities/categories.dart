// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:training_task1/domain/entities/base_entity.dart';
import 'package:training_task1/utils/data_base_config.dart';

class Category implements BaseEntity{
  int? _id;
  final String name;
  final IconData icon;
  final Color color;
  //should I make this a private constructor?
  Category(this._id, this.name, this.icon, this.color);

  Category.create({
    required this.name,
    required this.icon,
    required this.color,
  });

  @override
  int? get id => _id;
  @override
  String get table => AppKeys.categoryTable;

  Map<String, dynamic> _toMap() {
    return <String, dynamic>{
      'name': name,
      'icon': icon.codePoint,
      'color': color.value,
    };
  }

  @override
  Map<String, dynamic> get toMap => _toMap();

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      map['id'] != null ? map['id'] as int : null,
      map['name'] as String,
      IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
      Color(map['color'] as int),
    );
  }

}


  