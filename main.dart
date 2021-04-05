//import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Flutter Form Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController ipkController = TextEditingController();
  void tambahData() {
    // It returns true if the form is valid, otherwise returns false
    if (_formKey.currentState.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HalamanDua(
                nameController.text, nimController.text, ipkController.text)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Image.asset('assets/images/docs logo.png',
                  height: 100, width: 100),
            )
          ]),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your full name',
              labelText: 'Name',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: nimController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.find_in_page_rounded),
              hintText: 'Enter a phone NIM',
              labelText: 'Nim',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid NIM number';
              }
              return null;
            },
          ),
          TextFormField(
            controller: ipkController,
            decoration: const InputDecoration(
              icon: const Icon(Icons.school_outlined),
              hintText: 'Enter your IPK ',
              labelText: 'IPK',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter valid IPK';
              }
              return null;
            },
          ),
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              // ignore: deprecated_member_use
              child: new RaisedButton(
                child: const Text('Submit'),
                onPressed: tambahData,
              )),
        ],
      ),
    );
  }
}

class HalamanDua extends StatelessWidget {
  HalamanDua(this.name, this.nim, this.ipk);
//  String nomer, String ddd
  final String name;
  final String nim;
  final String ipk;

  String nilai() {
    double score = double.parse(ipk);

    if (score < 1.01) {
      return "D";
    } else if (score < 1.34) {
      return "D+";
    } else if (score < 1.67) {
      return "C-";
    } else if (score < 2.01) {
      return "C";
    } else if (score < 2.34) {
      return "C+";
    } else if (score < 2.67) {
      return "B-";
    } else if (score < 3.01) {
      return "B";
    } else if (score < 3.34) {
      return "B+";
    } else if (score < 3.67) {
      return "A-";
    } else {
      return "A";
    }
  }
  // String get ddd => ddd;

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    // throw UnimplementedError();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("test statefull"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Text(nameController.text),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Image.asset('assets/images/docs logo.png',
                            height: 140, width: 140),
                      )
                    ]),
                RichText(
                  text: TextSpan(
                      text: 'NAMA   : ',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                          text: name,
                        )
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'NIM       : ',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                          text: nim,
                        )
                      ]),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Nilai      : ',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                          text: nilai(),
                        )
                      ]),
                ),
                //          Text((() {if(ipk > '3.65'){
                //             return "tis true";}

                //   return "anything but true";
                // })());
                // Text(ddd),
                // ignore: deprecated_member_use
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      child: Icon(Icons.arrow_back_rounded),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
