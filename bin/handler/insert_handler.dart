part of '../router/router.dart';

Future<Response> _insertHandler(Request req) async{
  final String body = await req.readAsString();
  await infoLogWrite(req, body);
  try {
  final sqlReq =   jsonDecode(body)["sql"];
  final stmt = db.prepare(sqlReq);
  stmt.execute();
  stmt.dispose();
  return Response.ok("Successfully");
  } catch (e, s) {
    print("Error : $e");
    print("Stack : $s");
    errorLogWrite(e, s);
    return Response.badRequest();
  }
}