part of '../router/router.dart';

Future<Response> _selectHandler(Request req) async {
  final String body = await req.readAsString();
  await infoLogWrite(req, body);
  try {
    final sqlReq = jsonDecode(body) as Map;
    final result = db.select(sqlReq["sql"]);
    final response = {
      "data": result.toList().map((e) => e.toString()).toList(),
      "rows": result.rows,
      "columnNames": result.columnNames,
    };
    return Response.ok(jsonEncode(response));
  } catch (e, s) {
    print("Error : $e");
    print("Stack : $s");
    errorLogWrite(e, s);
    return Response.badRequest();
  }
}
