import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageService{
  
  // Singleton instance
  static final FlutterSecureStorageService _instance= FlutterSecureStorageService._();

  // Private constructor
  FlutterSecureStorageService._();

  // Get the singleton instance
  static FlutterSecureStorageService get instance => _instance;

  final _storage = const FlutterSecureStorage();


  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }
}