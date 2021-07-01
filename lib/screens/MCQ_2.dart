import 'package:flutter/material.dart';

import 'MCQ_3.dart';

class quiz2 extends StatefulWidget {
  @override
  _quiz2State createState() => _quiz2State();
}

class _quiz2State extends State<quiz2> {
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
                        'The following sorting algorithms maintain two sub-lists, one sorted and one to be sorted.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    RadioListTile(
                      value: 1,
                      groupValue: selectedRadioTile,
                      title: Text("Selection sort"),
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
                      title: Text("Insertion sort"),
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
                      title: Text("Merge sort"),
                      onChanged: (val) {
                        print("Radio Tile pressed $val");
                        setSelectedRadioTile(val);
                      },
                      activeColor: Colors.red,
                      selected: false,
                    ),
                    RadioListTile(
                      value: 4,
                      groupValue: selectedRadioTile,
                      title: Text("Both A & B"),
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
                        return quiz3();
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

//''
