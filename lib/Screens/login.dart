import 'package:flutter/material.dart';
import 'package:stockmarketapp/Screens/home.dart';
import 'package:stockmarketapp/Screens/register.dart';
import '../Authentication/Methods.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //createFileIfNotExists();
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: size.height / 30,
            ),
            TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                hintText: "E-Mail",
                icon: Icon(Icons.abc),
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            TextFormField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Passwort",
                icon: Icon(Icons.lock),
              ),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            customButton(size),
            SizedBox(
              height: size.height / 30,
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => RegisterPage())),
              child: const Text(
                "Noch keinen Account? Jetzt Registrieren!",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (_email.text.isNotEmpty &&
            _password.text.isNotEmpty) {
          login(context, _email.text, _password.text);
          Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
        } else {
          _showFailedLoginDialog();
        }
      },
      child: Container(
        height: size.height / 15,
        width: size.width / 1.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        child: const Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> _showFailedLoginDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Anmeldung fehlgeschlagen!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Bitte füllen Sie alle Felder korrekt aus.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
