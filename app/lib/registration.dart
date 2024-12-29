import 'package:flutter/material.dart';
import 'messenger.dart';
import 'dart:convert';
// import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}



class _RegistrationState extends State<Registration> {

  List<DropdownMenuItem<String>> dropdownItems = [
    DropdownMenuItem(child: Text("To"),value: '__disabled__'),
  ];

  void initState(){
    super.initState();
    print('lyublino');
    IOWebSocketChannel channel = IOWebSocketChannel.connect("ws://192.168.1.52:8080/get_users");
    channel.stream.listen((data){
      print(json.decode(data)[0]);
      for (var element in json.decode(data)) {
        dropdownItems.add(DropdownMenuItem(child: Text(element),value: element));
      }
      
    });
    dropdownItems.add(DropdownMenuItem(child: Text('Not Founded'),value: '__not__founded__'));
  }

  String _name_from = '';
  String _name_to = '';

  _changeName_from(String text){
    setState(() =>_name_from = text);
  }

  _changeName_to(String text){
    setState(() =>_name_to = text);
  }

  String selectedValue = "__disabled__";

  bool chooseDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
      
      body: SafeArea(
        child: Column(
          
          children: [
            Container(
              margin: EdgeInsets.all(20),
              // color: Color.fromARGB(255, 208, 171, 23),
              
              child: TextField(
                
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                ),
                  contentPadding: EdgeInsets.all(10),
                  filled: true,
                  fillColor: Color.fromARGB(255, 208, 171, 23),
                  hintText: 'From'
                ),
                onChanged: (value) {
                  _changeName_from(value);
                },
              ),
            ),
            Container(
            margin: EdgeInsets.all(10),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 208, 171, 23), width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 208, 171, 23), width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 208, 171, 23),
              ),
              dropdownColor: Color.fromARGB(255, 208, 171, 23),
              value: selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                  _name_to = newValue;
                });
                print(selectedValue);
              },
              items: dropdownItems),
          ),
            selectedValue=='__not__founded__'
            ?
            Container(
              margin: EdgeInsets.all(20),
              // color: Color.fromARGB(255, 208, 171, 23),
              
              child: TextField(
                
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                ),
                  contentPadding: EdgeInsets.all(10),
                  filled: true,
                  fillColor: Color.fromARGB(255, 208, 171, 23),
                  hintText: 'To'
                ),
                onChanged: (value) {
                  _changeName_to(value);
                },
              ),
            )
            :
            Container(),
            chooseDisabled
            ?
            Text('Choose a sobesednika', style: TextStyle(
              color: Colors.red,
              fontSize: 23
            ),)
            :
            Text('')
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (selectedValue=='__disabled__') {
            setState(() {
              chooseDisabled = true;
            }); 
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Messenger(name_from: _name_from, name_to: _name_to, channel: IOWebSocketChannel.connect("ws://192.168.1.52:8080?from=${_name_from}&to=${selectedValue}")),
              )
            );
          }
        }, 
        child: Icon(Icons.add_circle_outline),
      )
    )
    );
  }
}