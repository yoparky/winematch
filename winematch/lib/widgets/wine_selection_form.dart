import 'package:flutter/material.dart';
import '../models/wine_type.dart';

List<String> wineList = [];
String _wineSelection = '';

class WineSelectionForm extends StatefulWidget {
  WineSelectionForm(this.wineType, {super.key});

  WineType wineType;

  @override
  WineSelectionFormState createState() {
    return WineSelectionFormState();
  }
}

class WineSelectionFormState extends State<WineSelectionForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    wineList = widget.wineType.nameList;
    _wineSelection = wineList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Pick subtype')),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Placeholder(),
                    DropdownButtonFormField<String>(
                        value: _wineSelection,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        onChanged: (String? value) {
                          setState(() {});
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _wineSelection = value!;
                          });
                        },
                        items: wineList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(_wineSelection)));
                          }
                        },
                        child: const Text('Submit'))
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
