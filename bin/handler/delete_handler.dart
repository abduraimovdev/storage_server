part of '../router/router.dart';

Future<Response> _deleteHandler(Request req) async {
  final String body = await req.readAsString();
  await infoLogWrite(req, body);
  try {
    final sqlReq = jsonDecode(body) as Map;
    db.execute(sqlReq["sql"]);
    return Response.ok("Successfully deleted ");
  } catch (e, s) {
    print("Error : $e");
    print("Stack : $s");
    errorLogWrite(e, s);
    return Response.badRequest();
  }
}
