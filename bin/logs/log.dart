import 'dart:io';
int errorCount = 0;
void errorLogWrite(Object e, StackTrace s) async{
  final file = File("bin/logs/error_logs.txt");
  String content  = await file.readAsString();

  content += """

##################################################################################  
Number : $errorCount

"Error" : ${e.toString()},\n
----------------------------------------------------------------------------------
"StackTrace" : ${s.toString()},
##################################################################################


  """;
  await file.writeAsString(content);
  errorCount++;
}

void showLog() {
  final file = File("bin/logs/error_logs.txt");
  print(file.readAsString());
}