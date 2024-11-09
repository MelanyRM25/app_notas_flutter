import 'package:flutter/material.dart';
import 'package:notas_app/pages/formulario.dart';
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
        return Colors.yellow;
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
                Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: colorGet(notes[index]['color']),
                    textColor: Colors.white,
                    title: Text(notes[index]['title']),
                    subtitle: Text(notes[index]['content']),
                    leading: FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () async {
                              await Navigator.push(context, MaterialPageRoute(builder: (context) => Formulario(
                                id: notes[index]['id'],
                                title: notes[index]['title'],
                                content: notes[index]['content']
                              )));
                              await notesGet();
                            },
                          ),
                          // IconButton(
                          //   icon: const Icon(Icons.delete),
                          //   onPressed: () async {
                          //     await AdminService().deleteNotes(notes[index]['id']);
                          //     await notesGet();
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) => Formulario())); 
          await notesGet();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
