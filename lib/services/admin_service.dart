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
}
