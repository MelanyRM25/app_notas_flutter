import 'package:flutter/material.dart';
import 'package:notas_app/services/admin_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notes = [];
  //List colors = [];
  @override
  void initState() {
    super.initState();
    //metodo para obtener las notas
    notesGet();
  }

  notesGet() async {
    // Recuperar datos de BD backend
    notes = await AdminService().getNotes();
    //print(notes);
    setState(() {});
  }

  colorGet(String color) {
    switch (color) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'grey':
        color;
        return Colors.grey;
      case 'orange':
        return Colors.orange;
      case 'yellow':
        return Colors.yellowAccent;
      default:
        return Colors.white;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      notesGet();
                    },
                    child: Text("Actualizar"))
              ],
            ),
            for (var note in notes)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  //color desde la BD
                  tileColor: colorGet(note['color']),
                  textColor: Colors.black,
                  title: Text(note['title']),
                  subtitle: Text(note['content']),
                ),
              )
          ],
        ));
  }
}
