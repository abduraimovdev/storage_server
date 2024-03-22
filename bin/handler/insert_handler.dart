part of '../router/router.dart';

Future<Response> _insertHandler(Request req) async{
  try {
  final sqlReq =   jsonDecode(await req.readAsString())["sql"];
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