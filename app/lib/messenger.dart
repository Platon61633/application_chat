import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:async';



class Messenger extends StatefulWidget {

  final String name_from;
  final String name_to;
  final WebSocketChannel channel;


  Messenger({super.key, required this.name_from, required this.name_to, required this.channel});
  @override
  State<Messenger> createState() => _MessengerState();
}

  List<List<dynamic>> messages = [['salam',false,2], ['salam-aleikum', true,4], ['how u?', false,7]];

class _MessengerState extends State<Messenger> {
  
  TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {

      // final streamController = StreamController.broadcast();
      // streamController.addStream(widget.channel.stream);

    // streamController.stream.listen(
    //     (data) {
    //       print(data);
    //       // setState(() {
    //       //   messages.add([data, false, 5]);
    //       // });
    //       // messages.add([_controller.text, true, 5]));
    //     },
    //     onError: (error) => print(error),
    //   );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Messenger"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('From: ${widget.name_from}'),
                  Text('To: ${widget.name_to}'),
                ],
              )
            ],
          ),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.only(bottom: 50),
            children: messages.map((item) => item[1]?MyMesseg(item[0]):BroMesseg(item[0])).toList()
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: Icon(Icons.arrow_back),
        // ),
        bottomSheet: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'data', 
              contentPadding: EdgeInsets.all(10),
              fillColor: const Color.fromARGB(255, 246, 226, 49),
              // border: InputBorder.none,
              filled: true,
              suffixIcon: IconButton(
                onPressed: (){
                  addMessage();
                }, 
                icon: const Icon(Icons.send)
              ),
            ),
            controller: _controller,
          ),
        ),
      ),
    );
  }

    Align BroMesseg(String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
      // alignment: Alignment(2, 0),
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      // color: Colors.amberAccent,
      child: Text(text),
    ),
    );
  }

  Align MyMesseg(String text) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
      // alignment: Alignment(2, 0),
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10), topLeft: Radius.circular(10)),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      // color: Colors.amberAccent,
      child: Text(text),
    ),
    );
  }
  void addMessage() {
    widget.channel.sink.add(_controller.text);
    setState(()=>messages.add([_controller.text, true, 5]));
    _controller.clear();
    widget.channel.stream.listen(
        (data) {
          // print(data);
          setState(() {
            messages.add([data, false, 5]);
          });
        },
        onError: (error) => print(error),
    );
  }
  

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}