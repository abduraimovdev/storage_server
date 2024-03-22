import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../database/database.dart';
import '../logs/log.dart';

part '../handler/create_table_handler.dart';
part '../handler/delete_handler.dart';
part '../handler/insert_handler.dart';
part '../handler/select_handler.dart';

final router = Router()
  ..get('/select/', _selectHandler)
  ..post('/insert/', _insertHandler)
  ..delete('/delete_handler.dart/', _deleteHandler)
  ..post('/create-table/', _createTableHandler);

