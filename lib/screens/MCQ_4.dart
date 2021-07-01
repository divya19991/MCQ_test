import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'MCQ_1.dart';

class quiz4 extends StatefulWidget {
  @override
  _quiz1State createState() => _quiz1State();
}

class _quiz1State extends State<quiz4> {
  int selectedRadioTile;
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('MCQ Test'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Visiting root node after visiting left and right sub-trees is called ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    RadioListTile(
                      value: 1,
                      groupValue: selectedRadioTile,
                      title: Text("In-order traversal"),
                      onChanged: (val) {
                        // print("Radio Tile pressed $val");
                        setSelectedRadioTile(val);
                      },
                      activeColor: Colors.red,
                      selected: false,
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: selectedRadioTile,
                      title: Text("Pre-Order traversal"),
                      onChanged: (val) {
                        print("Radio Tile pressed $val");
                        setSelectedRadioTile(val);
                      },
                      activeColor: Colors.red,
                      selected: false,
                    ),
                    RadioListTile(
                      value: 3,
                      groupValue: selectedRadioTile,
                      title: Text("Post-order traversal"),
                      onChanged: (val) {
                        print("Radio Tile pressed $val");
                        setSelectedRadioTile(val);
                      },
                      activeColor: Colors.red,
                      selected: false,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('Submit'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return quiz1();
                      }));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
