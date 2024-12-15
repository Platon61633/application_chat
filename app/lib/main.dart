import 'package:flutter/material.dart';
// import 'secondRoute.dart';
import 'registration.dart';
import 'messenger.dart';

// function to trigger build when the app is run
void main() {
runApp(MaterialApp(
	initialRoute: '/registration',
	routes: {
	'/registration': (context) => const Registration(),
  // '/messenger': (context) => const Messenger(),
	},
)); //MaterialApp
}



















// import 'package:flutter/material.dart';
// // import 'dart:io';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_channel/io.dart';
// import 'dart:convert'; // Для работы с JSON
// import 'dart:io';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final primaryColor = Color.fromARGB(255, 95, 103, 255);
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primaryColor: primaryColor,
//         scaffoldBackgroundColor: const Color(0xFFEFF1F3),
//         colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
//         useMaterial3: true,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }


// class HomeScreen extends StatefulWidget{

//   HomeScreen({ super.key});
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
// class _HomeScreenState extends State<HomeScreen>{

  

//   String _name = "Tom";
//   String _res = "";
//   _changeName(String text){
//     setState(() =>_name = text);
//   }


  
 
//   @override
//   Widget build(BuildContext context) {
 
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Text('отправленно: '+_name),
//             Text('принято: '+_res)
//           ],
//           crossAxisAlignment: CrossAxisAlignment.start,
//       )),
//       bottomNavigationBar: Wrap(
//                     children: [
//                       const ListTile(
//                         leading: Icon(Icons.edit),
//                         title: Text('edit'),
//                       ),
//                       const ListTile(
//                         leading: Icon(Icons.delete),
//                         title: Text('delete'),
//                       ),
//                       Container(
//                         padding: EdgeInsets.all(8),
//                         child: Padding(padding: EdgeInsets.only(
//                           bottom: MediaQuery.of(context).viewInsets.bottom),
//                           child: TextFormField(
//                             // cursorColor: Theme.of(context).cursorColor,
//                             initialValue: _name,
//                             style: TextStyle(fontSize: 22),
//                             onChanged: _changeName,
//                             decoration: const  InputDecoration(
//                               icon: Icon(Icons.favorite),
//                               labelText: 'Label Text',
//                               labelStyle: TextStyle(
//                                 color: Color.fromARGB(255, 48, 140, 186),
//                               ),
//                               helperText: 'Helper Text',
//                               suffixIcon: Icon(
//                                 Icons.check_circle
//                               ),
//                               enabledBorder: UnderlineInputBorder(
//                                 borderSide: BorderSide(color: Color.fromARGB(255, 48, 140, 186))
//                               )
//                             ),
//                           ),
//                           )
//                       )
//                     ],
//                   )
//                   );
//   }
// }


// // TextFormField(initialValue: _name,
// //           style: TextStyle(fontSize: 22),
// //           onChanged: _changeName),
