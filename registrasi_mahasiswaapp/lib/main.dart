import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //untuk tanggal
  DateTime _date = new DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2002),
        lastDate: new DateTime(1998));
    if (picked != null && picked != _date) {
      print('Tanggal terpilih: ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  //Radio Button
  int _groupValue1 = 0;

  //Select List
  List<String> _agama = ['Islam', 'Protestan', 'Katolik'];
  String _nAgama = 'Islam';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulir Registrasi Mahasiswa'),
        backgroundColor: Colors.cyan,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Nama Lengkap',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Email',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Password',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_on),
                        hintText: 'Tempat Lahir',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  RaisedButton(
                    child: Text('Pilih Tanggal Lahir'),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        onChanged: (int i) {
                          setState(() {
                            _groupValue1 = i;
                          });
                        },
                        value: 0,
                        groupValue: _groupValue1,
                      ),
                      Text('Laki-laki'),
                      Radio(
                        onChanged: (int i) {
                          setState(() {
                            _groupValue1 = i;
                          });
                        },
                        value: 1,
                        groupValue: _groupValue1,
                      ),
                      Text('Perempuan')
                    ],
                  ),
                  Text(
                    'Agama : ',
                    style: TextStyle(color: Colors.black87, fontSize: 16.0),
                  ),
                  DropdownButtonFormField(
                    onChanged: (String value) {
                      setState(() {
                        _nAgama = value;
                      });
                    },
                    value: _nAgama,
                    items: _agama.map((String value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
