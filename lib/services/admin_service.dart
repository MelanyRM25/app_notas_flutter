import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AdminService {
  //vamos al endpoint del backend
  static const url = 'http://127.0.0.1:8000/api/';
  //Obtener notas del endpoint
  Future getNotes() async {
    var response =
        await http.get(Uri.parse(url + 'notes')); //va a la ruta 'locatrion'
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body); //trae datos con Json
      return jsonResponse; //retorna un json
    } else {
      return 'Error'; //si no hay datos "error"
    }
  }


  Future postNote(String title, String content) async {
    var response = await http.post(Uri.parse(url + 'notes'),
        body:({
          "title": title,
          "content": content,
        }));

        
    if (response.statusCode == 200) {
      return 'Success'; //si hay datos "success"
    } else {
      return 'Error'; //si no hay datos "error"
    }
  }
  Future putNotes(int id, String title, String content) async {
    var response = await http.put(Uri.parse(url + 'notes/$id'),
        // headers: {"Content-Type": "application/json"},
        body:({
          "title": title,
          "content": content,
        }));

        
    if (response.statusCode == 200) {
      return 'Success'; //si hay datos "success"
    } else {
      return 'Error'; //si no hay datos "error"
    }
  }
}
