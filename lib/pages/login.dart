import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:notas_app/pages/home_page.dart';
import 'package:notas_app/services/admin_service.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {

      TextEditingController email_controller = TextEditingController();
    TextEditingController password_controller = TextEditingController();

    void login() async {
    var res = await AdminService().login(email_controller.text, password_controller.text);
    if (res) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }else{
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Email or password incorrect'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {

  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: email_controller,
                decoration: const InputDecoration(
                  hintText: 'Username',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: password_controller,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: login,
                  child: const Text('Login'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),    
                ),
              ),    
            ],    
          ),
        ),
      ),
    );  
  }
}