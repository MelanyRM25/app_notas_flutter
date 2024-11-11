import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:localstorage/localstorage.dart';

class AdminService {
  //vamos al endpoint del backend
  static const url = 'http://127.0.0.1:8000/api/';



  Future login(String email, String password) async {
    var response = await http.post(Uri.parse(url + 'login'),
        body:({
          "email": email,
          "password": password,
        }));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body); //trae datos con Json
          var token = jsonResponse['token']; //guarda el token en una variable
          localStorage.setItem('token', token); //guarda el token en el localstorage
          print(jsonResponse);
      return true; //retorna un json
    }   else {
      return false; //si no hay datos "error"
    }
  }
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

  Future deleteNotes(int id) async {
    var response = await http.delete(Uri.parse(url + 'notes/$id'));
    if (response.statusCode == 200) {
      return 'Success'; //si hay datos "success"
    } else {
      return 'Error'; //si no hay datos "error"
    }
  }
}
