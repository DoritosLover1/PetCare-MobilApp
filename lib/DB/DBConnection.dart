import 'dart:async';

import 'package:dog_care/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';


/// DB'DE OLACAK OLANLAR İÇİN NELER EKLENMESİ GEREKTİĞİNİ TARTIŞMALIYIM.
class DBConnection {
  sql.Database? _database;

  DBConnection._();

  static final DBConnection _instance = DBConnection._();

  factory DBConnection() {
    return _instance;
  }

  Future<void> _initiliazeDB() async { 
    if (_database != null ) return;

    try{
        final dpPath = await sql.getDatabasesPath();
        final path = join(dpPath, 'archieve.db');

        _database = await sql.openDatabase(
        path,
        version: 1,
        onCreate: (sql.Database database, int version) async {
          await _createTables();
        },
      );
    } catch (e) {
      
    }
  }

  Future<void> _createTables() async {
    await _database!.execute("""
    CREATE TABLE Animals(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT NOT NULL,
    age INT NOT NULL,
    breed TEXT NOT NULL,
    type TEXT NOT NULL
    )
    """);

    await _database!.execute("""
    CREATE TABLE Dates(
    id INTEGER PRIMATY KEY AUTOINCREMENT NOT NULL,
    animal_id INTEGER NOT NULL,
    date TEXT NOT NULL,
    event_type TEXT,
    notes TEXT,
    is_done INT NOT NULL,
    FOREIGN KEY (animal_id) REFERENCES Animals(id) ON DELETE CASCADE
    )
    """);

    await _database!.execute("""
    CREATE TABLE Albums(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    animal_id INTEGER NOT NULL,
    photo_blob BLOB NOT NULL,
    description TEXT,
    created_at TEXT DEFAULT (datetime('now', 'localtime')),
    FOREIGN KEY (animal_id) REFERENCES Animals(id) ON DELETE CASCADE
    )
    """);
  }

  // ----------------- ALL CRUD OPERATIONS BELOW -----------------
  // Create Operations for each table
  Future<int?> createAnimal(String name, int age, String breed, String type) async {
    await _initiliazeDB();

    try{
      if(_database!.isOpen){
        await _database!.insert("Animals",
        {
          'name': name,
          'age': age,
          'breed': breed,
          'type': type
        },
        conflictAlgorithm: sql.ConflictAlgorithm.ignore
        );
        _database!.close();
        return 1;
      }
      else{
         _database!.close();
        return 0;
      }
    }on DatabaseException catch (e) {
       _database!.close();
      return null;
    }
  }

  Future<int?> createDate(int animal_id, String date, String? event_type, String? notes) async {
    /*
    """
    CREATE TABLE Dates(
    id INTEGER PRIMATY KEY AUTOINCREMENT NOT NULL,
    animal_id INTEGER NOT NULL,
    date TEXT NOT NULL,
    event_type TEXT,
    notes TEXT,
    FOREIGN KEY (animal_id) REFERENCES Animals(id) ON DELETE CASCADE
    )
    """
    */

    try{
      if(_database!.isOpen) {
          await _database!.insert("Dates",
          {
            "animal_id": animal_id,
            "date": date,
            "event_type": event_type,
            "notes": notes
          },
          conflictAlgorithm: sql.ConflictAlgorithm.ignore
          );
          _database!.close();
          return 1;
      } else {
          _database!.close();
          return 0;
      }
    }on DatabaseException catch(e) {
       _database!.close();
       return null;
    }
  }

  Future<int?> createAlbum(int animal_id, Uint8List photo_blob, String? description) async {
    /*
    """
    CREATE TABLE Albums(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    animal_id INTEGER NOT NULL,
    photo_blob BLOB NOT NULL,
    description TEXT,
    created_at TEXT DEFAULT (datetime('now', 'localtime')),
    FOREIGN KEY (animal_id) REFERENCES Animals(id) ON DELETE CASCADE
    )
    """
    */

    try{
      if(_database!.isOpen) {
          await _database!.insert("Albums",
          {
            "animal_id": animal_id,
            "photo_blob": photo_blob,
            "description": description
          },
          conflictAlgorithm: sql.ConflictAlgorithm.ignore
          );
          _database!.close();
          return 1;
      } else {
          _database!.close();
          return 0;
      }
    }on DatabaseException catch(e) {
       _database!.close();
       return null;
    }
  }

  // Update Operations for each table
  Future<int?> updateAnimal(int id, String name, int age, String breed, String type) async {
    await _initiliazeDB();

    try{
      if(_database!.isOpen){
        int count = await _database!.update("Animals",
        {
          'name': name,
          'age': age,
          'breed': breed,
          'type': type
        },
        where: "id = ?",
        whereArgs: [id],
        conflictAlgorithm: sql.ConflictAlgorithm.replace
        );
        _database!.close();
        return count;
      }
      else{
         _database!.close();
        return 0;
      }
    }on DatabaseException catch (e) {
       _database!.close();
      return null;
    }
  }

  Future<int?> updateDate(int id, String date, String? event_type, String? notes, int is_done) async {
    /*
    """
    CREATE TABLE Dates(
    id INTEGER PRIMATY KEY AUTOINCREMENT NOT NULL,
    animal_id INTEGER NOT NULL,
    date TEXT NOT NULL,
    event_type TEXT,
    notes TEXT,
    FOREIGN KEY (animal_id) REFERENCES Animals(id) ON DELETE CASCADE
    )
    """
    */

    try{
      if(_database!.isOpen) {
          int count = await _database!.update("Dates",
          {
            "date": date,
            "event_type": event_type,
            "notes": notes,
            "is_done": is_done
          },
          where: "id = ?",
          whereArgs: [id],
          conflictAlgorithm: sql.ConflictAlgorithm.replace
          );
          _database!.close();
          return count;
      } else {
          _database!.close();
          return 0;
      }
    }on DatabaseException catch(e) {
       _database!.close();
       return null;
    }
  }

  Future<int?> updateAlbum(int id, Uint8List photoBlob, String? description) async {
    /*
    """
    CREATE TABLE Albums(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    animal_id INTEGER NOT NULL,
    photo_blob BLOB NOT NULL,
    description TEXT,
    created_at TEXT DEFAULT (datetime('now', 'localtime')),
    FOREIGN KEY (animal_id) REFERENCES Animals(id) ON DELETE CASCADE
    )
    """
    */

    try{
      if(_database!.isOpen) {
          int count = await _database!.update("Albums",
          {
            "photo_blob": photoBlob,
            "description": description
          },
          where: "id = ?",
          whereArgs: [id],
          conflictAlgorithm: sql.ConflictAlgorithm.replace
          );
          _database!.close();
          return count;
      } else {
          _database!.close();
          return 0;
      }
    }on DatabaseException catch(e) {
       _database!.close();
       return null;
    }
  }

  // Delete Operations for each table
  Future<int?> deleteAnimal(int id) async {
    await _initiliazeDB();

    try{
      if(_database!.isOpen){
        int count = await _database!.delete(
          "Animals",
          where: "id = ?",
          whereArgs: [id],
        );
        _database!.close();
        return count;
      }
      else{
         _database!.close();
        return 0;
      }
    }on DatabaseException catch (e) {
       _database!.close();
      return null;
    }
  }

  Future<int?> deleteDate(int id) async {
    await _initiliazeDB();

    try{
      if(_database!.isOpen){
        int count = await _database!.delete(
          "Dates",
          where: "id = ?",
          whereArgs: [id],
        );
        _database!.close();
        return count;
      }
      else{
         _database!.close();
        return 0;
      }
    }on DatabaseException catch (e) {
       _database!.close();
      return null;
    }
  }

  Future<int?> deleteAlbum(int id) async {
    await _initiliazeDB();

    try{
      if(_database!.isOpen){
        int count = await _database!.delete(
          "Albums",
          where: "id = ?",
          whereArgs: [id],
        );
        _database!.close();
        return count;
      }
      else{
         _database!.close();
        return 0;
      }
    }on DatabaseException catch (e) {
       _database!.close();
      return null;
    }
  }

  // Gets Operations for each table
  // Returns null if error occurs or database is not open
  Future<List<Map<String, dynamic>>?> getAnimals() async {
    await _initiliazeDB();

    try{
      if(_database!.isOpen){
        final List<Map<String, dynamic>> maps = await _database!.query("Animals");
        _database!.close();
        return maps;
      }
      else{
         _database!.close();
        return null;
      }
    }on DatabaseException catch (e) {
       _database!.close();
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> getDates() async {
    await _initiliazeDB();

    try{
      if(_database!.isOpen){
        final List<Map<String, dynamic>> maps = await _database!.query("Dates");
        _database!.close();
        return maps;
      }
      else{
         _database!.close();
        return null;
      }
    }on DatabaseException catch (e) {
       _database!.close();
      return null;
    }
  }

  Future<List<Map<String, dynamic>>?> getAlbums() async {
    await _initiliazeDB();

    try{
      if(_database!.isOpen){
        final List<Map<String, dynamic>> maps = await _database!.query("Albums");
        _database!.close();
        return maps;
      }
      else{
         _database!.close();
        return null;
      }
    }on DatabaseException catch (e) {
       _database!.close();
      return null;
    }
  }

  // Get Animal by ID
  // Returns null if error occurs or database is not open
  Future<Map<String, dynamic>?> getAnimalById(int id) async {
    await _initiliazeDB();

    try{
      if(_database!.isOpen){
        final List<Map<String, dynamic>> maps = await _database!.query(
          "Animals",
          where: "id = ?",
          whereArgs: [id],
        );
        _database!.close();
        if(maps.isNotEmpty){
          return maps.first;
        } else {
          return null;
        }
      }
      else{
         _database!.close();
        return null;
      }
    }on DatabaseException catch (e) {
       _database!.close();
      return null;
    }
  }

  Future<Map<String, dynamic>?> getDateById(int id) async {
    await _initiliazeDB();

    try{
      if(_database!.isOpen){
        final List<Map<String, dynamic>> maps = await _database!.query(
          "Dates",
          where: "id = ?",
          whereArgs: [id],
        );
        _database!.close();
        if(maps.isNotEmpty){
          return maps.first;
        } else {
          return null;
        }
      }
      else{
         _database!.close();
        return null;
      }
    }on DatabaseException catch (e) {
       _database!.close();
      return null;
    }
  }

  Future<Map<String, dynamic>?> getAlbumById(int id) async {
    await _initiliazeDB();

    try{
      if(_database!.isOpen) {
        final List<Map<String, dynamic>> maps = await _database!.query(
          "Albums",
          where: "id = ?",
          whereArgs: [id],
        );
        _database!.close();
        if(maps.isNotEmpty){
          return maps.first;
        } else {
          return null;
        }
      } else {
          _database!.close();
          return null;
      }
    } on DatabaseException catch(e) {
        _database!.close();
        return null;
    }
  }

}