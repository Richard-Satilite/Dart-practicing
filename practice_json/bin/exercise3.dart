import 'package:http/http.dart';
import 'dart:convert';

//ORGANIZAR TIMES BASEADO EM UM CAMPO DE PRIORIDADE E NO LIMITE MÁXIMO POR TIME DEFINIDO
void main() {
  requestPlayers();
}

requestPlayers() async {
  String url =
      "https://gist.githubusercontent.com/Richard-Satilite/c3b03dea02cf95eb361d70a1c26ce41b/raw/7af9f90b76c0353fb06078642b29584ec1109164/players.json";
  Response response = await get(Uri.parse(url));
  int maxPerTeam, totalPlayers, totalTimes;
  Map<String, dynamic> mapPlayers = json.decode(response.body);
  maxPerTeam = mapPlayers["rules"]["playersPerTeam"];
  List<dynamic> players = mapPlayers["players"];
  totalPlayers = players.length;
  totalTimes = totalPlayers ~/ maxPerTeam;

  players.sort(
      (a, b) => (b["roundsWaiting"] as int).compareTo(a["roundsWaiting"]));

  for (var i = 1; i <= totalTimes; i++) {
    print("\nTime $i:\n");
    for (int j = (i - 1) * maxPerTeam; j < i * maxPerTeam; j++) {
      print(players[j]["name"]);
    }
  }
}
