import 'package:flutter/material.dart';
import 'package:notas_app/services/admin_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notes = [];
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

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      notesGet();
                    },
                    child: Text("Actualizar"))
              ],
            ),
            for (var note in notes)
              ListTile(
                title: Text(note['title']),
                subtitle: Text(note['content']),
              )
          ],
        ));
  }
}
