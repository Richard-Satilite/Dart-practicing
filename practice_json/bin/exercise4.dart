import 'package:http/http.dart';
import 'dart:convert';

//BUSCAR CONSULTAS DE UM DETERMINADO VETERINÁRIO ORDENANDO POR DATA E HORA DA CONSULTA
void main() {
  requestConsultas("Dra. Patrícia Gomes");
}

requestConsultas(String veterinario) async {
  String url =
      "https://gist.githubusercontent.com/Richard-Satilite/86f4b0ef306bf4f6d2e86f729a680ee4/raw/d720be59a2960df4869bf694181040fb68f29345/vet.json";
  Response response = await get(Uri.parse(url));
  List<dynamic> consultas = json.decode(response.body), consultasVet;

  consultasVet = consultas
      .where((consulta) => consulta["veterinarian"] == veterinario)
      .toList();

  consultasVet.sort((a, b) => DateTime.parse(a["appointment"])
      .compareTo(DateTime.parse(b["appointment"])));

  print("Consultas do veterinário(a): $veterinario\n");
  for (Map<String, dynamic> consulta in consultasVet) {
    print("Data: ${consulta["appointment"]}\nPet: ${consulta["pet_name"]}\n");
  }
}
