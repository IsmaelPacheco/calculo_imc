import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
            ),
            onPressed: () => {},
          ),
        ],
      ),
      backgroundColor: Colors.orange[400],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            Icons.person,
            size: 120.0,
            color: Colors.black,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Peso (kg)",
              labelStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Altura (cm)",
              labelStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
          ),
          Container(
            height: 30,
            child: RaisedButton(
              onPressed: () => {},
              child: Text(
                "Calcular",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
