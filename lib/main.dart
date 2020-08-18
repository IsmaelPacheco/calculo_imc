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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados!";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
    });
  }

  void _calculate() {
    setState(
      () {
        double weight = double.parse(weightController.text);
        double height = double.parse(heightController.text) / 100;
        double imc = weight / (height * height);

        if (imc < 18.6) {
          _infoText = "ABAIXO DO PESO\n IMC: ${imc.toStringAsPrecision(3)}";
        } else if (imc >= 18.6 && imc < 24.9) {
          _infoText = "PESO IDEAL\n IMC: ${imc.toStringAsPrecision(3)}";
        } else if (imc >= 24.9 && imc < 29.9) {
          _infoText =
              "LEVEMENTE ACIMA DO PESO\n IMC: ${imc.toStringAsPrecision(3)}";
        } else if (imc >= 29.9 && imc < 34.9) {
          _infoText = "OBESIDADE Grau I.\n IMC: ${imc.toStringAsPrecision(3)}";
        } else if (imc >= 34.9 && imc < 39.9) {
          _infoText = "OBESIDADE Grau II.\n IMC: ${imc.toStringAsPrecision(3)}";
        } else if (imc >= 40) {
          _infoText = "OBESIDADE Grau III.\n IMC:${imc.toStringAsPrecision(3)}";
        }
      },
    );
  }

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
            onPressed: _resetFields,
          ),
        ],
      ),
      backgroundColor: Colors.orange[400],
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person,
                size: 120.0,
                color: Colors.black,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: weightController,
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
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira seu Peso!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: heightController,
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira sua Altura!";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _calculate();
                      }
                    },
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
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
