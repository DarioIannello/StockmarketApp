import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screens/login.dart';

Future<User?> createAccount(
    BuildContext context, String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      print("Account wurde erstellt!");

      user.updateDisplayName(name);

      return user;
    } else {
      _showFailedRegistrationDialog(context);
      return user;
    }
  } catch (e) {
    _showFailedRegistrationDialog(context);
    return null;
  }
}

Future<User?> login(BuildContext context, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      return user;
    } else {
      _showFailedLoginDialog(context);
      return user;
    }
  } catch (e) {
    _showFailedLoginDialog(context);
    return null;
  }
}

Future logout(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((user) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
    });
  } catch (e) {
    print(e);
  }
}

Future<void> _showFailedRegistrationDialog(BuildContext context) async {
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

Future<void> _showFailedLoginDialog(BuildContext context) async {
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
