import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Nota Trimestral",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController p1Controller = new TextEditingController();
  TextEditingController p2Controller = new TextEditingController();
  TextEditingController trimController = new TextEditingController();
  TextEditingController acController = new TextEditingController();
  TextEditingController simController = new TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void _resetAll() {
    p1Controller.text = "";
    p2Controller.text = "";
    trimController.text = "";
    acController.text = "";
    simController.text = "";
    setState(() {
      _infoField = "Preencha os Campos";
      _formKey = GlobalKey<FormState>();
    });
  }

  String _infoField = "Preencha os Campos";

  void _calculate() {
    setState(() {
      double p1 = double.parse(p1Controller.text);
      double trim = double.parse(trimController.text);
      double ac = double.parse(acController.text);
      double sim = double.parse(simController.text);
      double media;

      trim = (trim * 3) / 10;
      if (p2Controller.text == "") {
        double pm = (p1 * 3) / 10;
        media = (pm + trim) + (ac * 3 / 10) + (sim / 10);
      }
      else {
        double p2 = double.parse(p2Controller.text);
        double pm = (p1 + p2) / 2;
        pm = (pm * 3) / 10;
        media = (pm + trim) + (ac * 3 / 10) + (sim / 10);
      }

      String mediaFloor = media.toStringAsPrecision(3);
      
      if (media >= 0 && media <= 5) {
        _infoField = "Média: ($mediaFloor)";
      }
      else if (media > 5 && media < 7) {
        _infoField = "Média: ($mediaFloor)";
      }
      else if (media >= 7 && media < 9) {
        _infoField = "Média: ($mediaFloor)";
      }
      else if (media >= 9 && media <= 10) {
        _infoField = "Média: ($mediaFloor)";
      }
      else if (media > 10 || media < 0) {
        _infoField = "Valores inválidos";
      }
      else {
        _infoField = "Algo deu errado";
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cálculo de Média"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetAll,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Container(
                    color: Colors.blue[900],
                    width: 400,
                    height: 70,
                    child: Center(
                      child: Text(
                        _infoField,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white,fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  // CAMPO NOTA P1
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Nota P1",
                          labelStyle: TextStyle(color: Colors.greenAccent[700], fontSize: 12),
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        controller: p1Controller,
                        
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Insira a P1";
                          }
                        },
                        
                      ),
                    )
                  ),
                  // CAMPO NOTA P2
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Nota P2",
                          labelStyle: TextStyle(color: Colors.greenAccent[700], fontSize: 12),
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        controller: p2Controller,
                      ),
                    ),
                  ),
                ],
              ),
              // CAMPO NOTA TRIMESTRAL
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Nota Trimestral",
                  labelStyle: TextStyle(color: Colors.greenAccent[700], fontSize: 12),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                controller: trimController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira a Trimestral";
                  }
                },
              ),
              
              Row(
                children: <Widget>[
                  // CAMPO NOTA AC
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Nota AC",
                          labelStyle: TextStyle(color: Colors.greenAccent[700], fontSize: 12),
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        controller: acController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Insira o AC";
                          }
                        },
                      ),
                    ),
                  ),
                  // CAMPO NOTA SIMULADO
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Nota Simulado",
                          labelStyle: TextStyle(color: Colors.greenAccent[700], fontSize: 12),
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        controller: simController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Insira o Simulado";
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
              // BOTÃO
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: _calculate,
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        color: Colors.white, fontSize: 20,
                      ),
                    ),
                    color: Colors.greenAccent[700],
                  )
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

