import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

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
    _isar = await Isar.open([], directory: dir.path);
    _isInitialized = true;
  }

  Isar get isar => _isar;
}
