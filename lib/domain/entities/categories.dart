// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:training_task1/domain/entities/base_entity.dart';
import 'package:training_task1/utils/data_base_config.dart';

class Category implements BaseEntity {
  int? _id;
  final String name;
  final IconData icon;
  final Color color;
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


  @override
  Map<String, dynamic>  toMap() =>{
        'name': name,
        'icon': icon.codePoint,
        'color': color.value,
      };

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      map['id'],
      map['name'] ,
      IconData(map['icon'] , fontFamily: 'MaterialIcons'),
      Color(map['color'] ),
    );
  }
}
