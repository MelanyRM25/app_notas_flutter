import 'package:flutter/material.dart';
import 'package:notas_app/services/admin_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List notas = [];
  @override
  void initState() {
    super.initState();
    //metodo para obtener las notas
    notesGet();
  }

  notesGet() async {
    // Recuperar datos de BD backend
    var notes = await AdminService().getNotes();
    print(notes);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
