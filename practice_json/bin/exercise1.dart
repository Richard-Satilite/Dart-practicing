import 'package:http/http.dart';
import 'dart:convert';

//EXERCÍCIO 1: EXIBIR LIVROS DE UM DETERMINADO AUTOR DISPONÍVEL EM UM REQUEST JSON
void main() {
  requestData();
}

requestData() async {
  String url =
          "https://gist.githubusercontent.com/Richard-Satilite/d7c2cdf7301e859bac260eaed39bb3f4/raw/1b483e61c30cb0689e07427ed87758baf7336b1d/books.json",
      autor = "Clarice Lispector";
  bool notExist = true;
  Response response = await get(Uri.parse(url));
  List<dynamic> books = jsonDecode(response.body);
  print("Livros do autor: $autor");
  for (Map<String, dynamic> book in books) {
    if (book["author"] == autor) {
      print(book["title"]);
      notExist = false;
    }
  }
  if (notExist) {
    print("Não há livros desse autor");
  }
}
