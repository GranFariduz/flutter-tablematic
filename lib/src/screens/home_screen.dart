import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  createState() => HomeState();
}

class HomeState extends State<Home> {
  final _input1Controller = TextEditingController();
  final _input2Controller = TextEditingController();

  List<String> tables = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Tablematic', style: TextStyle(fontSize: 22.0),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.purple),
            child: Container(
              padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  numInput('Enter an integer', _input1Controller),
                  Container(margin: EdgeInsets.only(right: 10.0)),
                  Container(
                    child: Text(
                      '|',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(margin: EdgeInsets.only(right: 10.0)),
                  numInput('Enter the limit here', _input2Controller),
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: onSubmit,
                      iconSize: 40.0,
                      color: Colors.white,
                      padding: EdgeInsets.all(2.0),
                      icon: Icon(Icons.arrow_right),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(3.0),
          child: ListView.builder(
            itemCount: tables.length,
            itemBuilder: (context, int index) {
              return Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  tables[index]
                ),
              ));
            },
          ),
        ),
      ),
    );
  }

  Widget numInput(String text, TextEditingController controller) {
    return Expanded(
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(1.0)),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: text,
          hintStyle: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.all(10.0),
        ),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  onSubmit() {
    RegExp regex = RegExp(r'^[0-9]+$');

    this.setState(() => tables.clear());

    if ((_input1Controller.text.contains(regex)) &&
        _input2Controller.text.contains(regex)) {
      int num1 = int.parse(_input1Controller.text);
      int num2 = int.parse(_input2Controller.text);
      for (int i = 1; i <= num2; i++) {
        this.setState(() {
          tables.add('$num1 x $i = ${num1 * i}');
        });
      }
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Input Error'),
              content: Text('Please enter a valid integer!'),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  dispose() {
    _input1Controller.dispose();
    _input2Controller.dispose();
    super.dispose();
  }
}
