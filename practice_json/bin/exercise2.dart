import 'package:http/http.dart';
import 'dart:convert';

//BUSCAR AS RECEITAS POSSÍVEIS DE UMA LISTA JSON DE RECEITAS BASEADO NOS INGREDIENTES DISPONÍVEIS
void main() {
  List<String> ingredientes = [
    "500g de feijão preto",
    "200g de carne seca",
    "150g de costelinha de porco",
    "150g de linguiça calabresa",
    "150g de paio",
    "1 cebola grande",
    "2 dentes de alho",
    "Sal a gosto",
    "Louro a gosto"
  ];

  requestRecipes(ingredientes);
}

requestRecipes(List<String> ingredientes) async {
  String url =
      "https://gist.githubusercontent.com/Richard-Satilite/e4a52cf2420b3ca3f8b0a8fecdd3a581/raw/91212577980d072a439402224b894a3545b7ae71/recipes2.json";
  Response response = await get(Uri.parse(url));
  List<dynamic> receitas = json.decode(response.body);
  print("Receitas possíveis com os ingredientes:\n${ingredientes.join(", ")}");
  for (Map<String, dynamic> receita in receitas) {
    List<dynamic> currIngrediente = receita["ingredients"];
    bool exist = ingredientes
        .every((ingrediente) => currIngrediente.contains(ingrediente));

    if (exist) {
      print("\n${receita["name"]}");
    }
  }
}
