import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  static const noteBox = 'notes';
  static const taskBox = 'tasks';
  static const habitBox = 'habits';
  static const eventBox = 'events';
  static const settingsBox = 'settings';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(noteBox);
    await Hive.openBox(taskBox);
    await Hive.openBox(habitBox);
    await Hive.openBox(eventBox);
    await Hive.openBox(settingsBox);
  }

  static Box<dynamic> box(String boxName) => Hive.box(boxName);

  static List<Map<String, dynamic>> readList(String boxName) {
    final raw = box(boxName).get('items');
    if (raw is List) {
      return raw
          .cast<Map<dynamic, dynamic>>()
          .map((item) => Map<String, dynamic>.from(item))
          .toList();
    }
    return [];
  }

  static Future<void> saveList(String boxName, List<Map<String, dynamic>> items) async {
    await box(boxName).put('items', items);
  }

  static T? readValue<T>(String boxName, String key) => box(boxName).get(key) as T?;

  static Future<void> saveValue<T>(String boxName, String key, T value) async {
    await box(boxName).put(key, value);
  }
}
