import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reservasi_rawat_jalan_mobile/features/common/data/models/user_db_model.dart';

class AppDatabase {
  bool _isInitialized = false;
  late Isar _isar;

  static final AppDatabase _instance = AppDatabase._init();

  factory AppDatabase() => _instance;

  AppDatabase._init();

  Future<void> initialize() async {
    if (_isInitialized) {
      return;
    }

    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([UserDbModelSchema],
        directory: dir.path, inspector: true);
    _isInitialized = true;

    log('Isar Database initialized $_isInitialized');
  }

  Isar get isar => _isar;
}
