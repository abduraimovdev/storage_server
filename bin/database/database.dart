import 'package:sqlite3/sqlite3.dart';

late Database db;
Future<void> init() async{
  print('Using sqlite3 ${sqlite3.version}');

  db = sqlite3.openInMemory();
}