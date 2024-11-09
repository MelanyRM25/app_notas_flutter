import 'package:flutter/material.dart';
import 'package:notas_app/services/admin_service.dart';

class Formulario extends StatefulWidget {
  final String? title;
  final String? content;
  final int? id;

  const Formulario({super.key,this.title,this.content,this.id});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  //campos de formulario
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text = widget.title ?? '';
    contentController.text = widget.content ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: "Content"),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.black),
              onPressed: () async {
                if (widget.id != null) {
                  await AdminService().putNotes(widget.id!, titleController.text, contentController.text);
                }else{
                  await AdminService().postNote(titleController.text, contentController.text);
                }
                Navigator.pop(context);
              },
              child: Text("Guardar Nota"))
        ],
      ),
              
    );
  }
}
