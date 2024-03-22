part of '../router/router.dart';

Future<Response> _deleteHandler(Request req) async {
  try {
    final sqlReq = jsonDecode(await req.readAsString()) as Map;
    db.execute(sqlReq["sql"]);
    return Response.ok("Successfully deleted ");
  } catch (e, s) {
    print("Error : $e");
    print("Stack : $s");
    errorLogWrite(e, s);
    return Response.badRequest();
  }
}
