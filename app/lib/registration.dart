import 'package:flutter/material.dart';
import 'messenger.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}



class _RegistrationState extends State<Registration> {

  String _name_from = '';
  String _name_to = '';

  _changeName_from(String text){
    setState(() =>_name_from = text);
  }

  _changeName_to(String text){
    setState(() =>_name_to = text);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
          decoration: InputDecoration(labelText: 'From'),
          onChanged: (value) {
            _changeName_from(value);
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'To'),
          onChanged: (value) {
            _changeName_to(value);
          },
        )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Messenger(name_from: _name_from, name_to: _name_to, channel: IOWebSocketChannel.connect("ws://192.168.1.52:8080?from=${_name_from}&to=${_name_to}")),
            )
          );
        }, 
        child: Icon(Icons.add_circle_outline),
      )
    )
    );
  }
}