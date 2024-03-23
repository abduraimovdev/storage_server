import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
final infoFile = File("bin/logs/request_info_log.txt");
final errorFile = File("bin/logs/error_logs.txt");
int errorCount = 0;
int requestCount = 0;
void errorLogWrite(Object e, StackTrace s) async{
  String content  = await errorFile.readAsString();

  content += """

##################################################################################  
Number : $errorCount

"Error" : ${e.toString()},\n
----------------------------------------------------------------------------------
"StackTrace" : ${s.toString()},
##################################################################################


  """;
  await errorFile.writeAsString(content);
  errorCount++;
}

void showErrorLog() {
  print(errorFile.readAsString());
}


Future<void> infoLogWrite(Request req, String body) async{
  String content  = await infoFile.readAsString();

  content += """
##################################################################################
Number : $requestCount,

Request : ${req.method}  ${req.url.path}
**********************************************************************************
"Header" : ${req.headersAll},\n
----------------------------------------------------------------------------------
"Params" : ${req.url.queryParametersAll},\n
----------------------------------------------------------------------------------
"Body" : $body,
##################################################################################

  """;
  await infoFile.writeAsString(content);
  requestCount++;
}
void showInfoLog() {
  print(infoFile.readAsString());
}