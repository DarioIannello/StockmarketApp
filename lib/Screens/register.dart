import 'package:flutter/material.dart';
import 'package:stockmarketapp/Authentication/Methods.dart';
import 'package:stockmarketapp/Screens/home.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrieren'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: size.height / 30,
            ),
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(
                hintText: "Name",
                icon: Icon(Icons.abc),
              ),
            ),
            SizedBox(
              height: size.height / 50,
            ),
            TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                hintText: "E-Mail",
                icon: Icon(Icons.account_box),
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
              height: size.height / 50,
            ),
            TextFormField(
              controller: _confirmPassword,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Passwort Beschtätigen",
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
              onTap: () => Navigator.pop(context),
              child: const Text(
                "Zurück zum Login",
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
        if (_name.text.isNotEmpty &&
            _email.text.isNotEmpty &&
            _password.text.isNotEmpty &&
            _confirmPassword.text.isNotEmpty) {
          if (_password.text == _confirmPassword.text) {
            createAccount(context, _name.text, _email.text, _password.text);
            Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
          }
        } else {
          _showFailedRegistrationDialog();
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
          "Registrieren",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> _showFailedRegistrationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registrierung fehlgeschlagen!'),
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
