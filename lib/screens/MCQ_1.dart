import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'MCQ_2.dart';

class quiz1 extends StatefulWidget {
  FirebaseUser user;
  quiz1({user});
  @override
  _quiz1State createState() => _quiz1State();
}

class _quiz1State extends State<quiz1> {
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
                        'What about recursion is true in comparison with iteration',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    RadioListTile(
                      value: 1,
                      groupValue: selectedRadioTile,
                      title: Text("Very expensive in-terms of memory"),
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
                      title: Text("low-Performance"),
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
                      title: Text(
                          "Every recursion program can be written with iteration too"),
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
                      title: Text("All of the above are true"),
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
                        return quiz2();
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

//
