part of '../router/router.dart';

Future<Response> _createTableHandler(Request req) async {
  final String body = await req.readAsString();
  await infoLogWrite(req, body);
  try {
    final sqlReq = jsonDecode(body) as Map;
    db.execute(sqlReq["sql"]);
    return Response.ok("Successfully created table request : ${sqlReq["sql"]}");
  } catch (e, s) {
    print("Error : $e");
    print("Stack : $s");
    errorLogWrite(e, s);
    return Response.badRequest();
  }
}
