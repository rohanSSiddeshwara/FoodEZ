import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.parse("http://127.0.0.1:8000/food");
  http.Response res = await http.get(url);
  var json = jsonDecode(res.body);
  print(json["0"]);
}
