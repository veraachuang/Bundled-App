import 'dart:convert';

import 'package:flutter_donation_app/models/ngo.dart';
import 'package:http/http.dart' as http;

class HttpService {
  /* Future<List<Ngo>> fetchNgos() async {
    print("fetching ngos . . .");
    http.post(
        Uri.parse(
            "https://bundledapp-default-rtdb.asia-southeast1.firebasedatabase.app/ngosprofile.json"),
        body: json.encode({}));
    final response =
        await http.get(Uri.parse("http://192.168.0.101:8080/api/ngo/list"));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      print("Data received successfully: $body");
      List<Ngo> ngos = body.map((dynamic item) => Ngo.toMap(item)).toList();
      print("Returned list: $ngos");
      return ngos;
    } else {
      print("Error when accessing API");
      throw "Unable to retrieve ngos.";
    }
  }
 */
  /* Future<Ngo> saveNgo(Ngo ngo) async {
    print("saving ngos . . .");
    print(jsonEncode(ngo));
    final response = await http.post(
        Uri.parse("http://192.168.0.101:8080/api/ngo/register"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(ngo));

    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      print("Dados recebidos com sucesso: $body");
        );
    } else {
      print("Erro ao acessar a API");
      throw "Unable to retrieve ngos.";
    }
  } */

  /* Future<Ngo> findNgoByEmail(String email) async {
    print("fetching ngo by email . . .");

    final response =
        await http.get(Uri.parse("http://192.168.0.101:8080/api/ngo/" + email));
    print(response.body.toString());
    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      print("Dados recebidos com sucesso: $body");
      return Ngo.fromJson(body);
    } else {
      print("Erro ao acessar a API");
      throw "Unable to retrieve ngos.";
    }
  }

  Future<Ngo> updateNgo(Ngo ngo, String id) async {
    print("saving ngos . . .");
    final response = await http.put(
        Uri.parse("http://192.168.0.101:8080/api/ngo/update/" + id),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(ngo));

    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      print("Dados recebidos com sucesso: $body");
      return Ngo.fromJson(body);
    } else {
      print("Erro ao acessar a API");
      throw "Unable to retrieve ngos.";
    }
  } */
}
