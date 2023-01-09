import 'package:intl/intl.dart';

String dateFormat(String dueDate){
  final apiDate = DateFormat('yyyy-MM-dd');
  DateTime fromAPi = apiDate.parse(dueDate);
  final dateFormat = DateFormat('dd/MM/yyyy');
  String resultDate = dateFormat.format(fromAPi);
  return resultDate;
}