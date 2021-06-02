import 'package:flutter/material.dart';
import 'home.dart';
import 'listpelanggan.dart';
import 'sign_in.dart';
import 'login_page.dart';
//pendukung program asinkron

class Index extends StatefulWidget {
  @override
  IndexState createState() => IndexState();
}

class IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    void handleClick(String value) {
      switch (value) {
        case 'Logout':
          signOutGoogle();
          Navigator.of(context).pop();

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return LoginPage();
          }), ModalRoute.withName('/'));
          break;
        case 'Settings':
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bonekaku'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(children: [
        Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: double.infinity,
            child: RaisedButton(
                child: Text("Daftar Item"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                }),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: double.infinity,
            child: RaisedButton(
              child: Text("Daftar Pelanggan"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPelanggan()),
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}
