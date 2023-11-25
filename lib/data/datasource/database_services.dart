import 'package:training_task1/data/datasource/data_base.dart';
import 'package:training_task1/domain/entities/base_entity.dart';


abstract class DataBaseServices<T extends BaseEntity> {
  final storage = StorageService();
  final String _whereId = 'id = ?';

  Future<int> create(T model) async {
    //static field database rather than a static method
    final db = await storage.database;
    return await db.insert(model.table, model.toMap());
  }

  Future<int> update(T model) async {
    final db = await storage.database;
    return await db.update(model.table, model.toMap(),
        where: _whereId, whereArgs: [model.id]);
  }

  Future<int> delete(T model) async {
    final db = await storage.database;
    return await db.delete(model.table, where: _whereId, whereArgs: [model.id]);
  }

  Future<T> retrieveOne(String table,
      T Function(Map<String, dynamic> map) fromMap, int? id) async {
    final db = await storage.database;
    List<Map<String, dynamic>> maps =
        await db.query(table, where: _whereId, whereArgs: [id], limit: 1);
    //fromMap function returns an object of type T
    return fromMap(maps.first);
  }

  Future<List<T>> retrieveAll(
    String table,
    T Function(Map<String, dynamic> map) fromMap,
  ) async {
    final db = await storage.database;
    var maps = await db.rawQuery('SELECT * FROM $table');
    return maps.map((e) => fromMap(e)).toList();
  }
}
