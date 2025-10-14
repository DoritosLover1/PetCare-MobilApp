import 'dart:async';

import 'package:dog_care/Pages/HomePage.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import '../Classes/Animals.dart';


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

    _database = await sql.openDatabase(
      'archieve.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await _createTables();
      }
    );
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

  Future<void> createAnimal(String name, int age, String breed, String type) async {
    await _initiliazeDB();

    try{
      if(_database!.isOpen){
        await _database!.insert("Animals",
        {
          'name': name,
          'age': age,
          'breed': breed,
          'type': type
        });
        _database!.close();
      }
      else{
        //ERROR ÇIKTISI OLACAK EKRANA
      }
    }on DatabaseException catch (e) {
      //ERRO ÇIKTISI GELECEK EKRANA.
    }
  }

  Future<void> createDate(int animal_id, String date, String? event_type, String? notes) async {
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
    await _initiliazeDB();

    try{
      if(_database!.isOpen) {
        await _database!.insert("Dates",
        {
          "animal_id": animal_id,
          "date": date,
          "event_type": event_type,
          "notes": notes
        }
        );
      }
    }on DatabaseException catch(e) {
      //ERROR GELECEK EKRANA İŞLEMSEL HATADAN KAYNAKLI
    }


  }
}