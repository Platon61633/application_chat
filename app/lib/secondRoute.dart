import 'package:flutter/material.dart';

// function to trigger build when the app is run
void main() {
runApp(MaterialApp(
	initialRoute: '/',
	routes: {
	'/': (context) => const HomeRoute(),
	'/second': (context) => const SecondRoute(),
	'/third': (context) => const ThirdRoute(),
	},
)); //MaterialApp
}

class HomeRoute extends StatelessWidget {
const HomeRoute({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: const Text('Geeks for Geeks'),
		backgroundColor: Colors.green,
	), // AppBar
	body: Center(
		child: Column(
		mainAxisAlignment: MainAxisAlignment.center,
		children: <Widget>[
			ElevatedButton(
			child: const Text('Click Me!'),
			onPressed: () {
				Navigator.pushNamed(context, '/second');
			},
			), // ElevatedButton
			ElevatedButton(
			child: const Text('Tap Me!'),
			onPressed: () {
				Navigator.pushNamed(context, '/third');
			},
			), // ElevatedButton
		], // <Widget>[]
		), // Column
	), // Center
	); // Scaffold
}
}

class SecondRoute extends StatelessWidget {
const SecondRoute({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: const Text("Click Me Page"),
		backgroundColor: Colors.green,
	), // AppBar
	body: Center(
		child: ElevatedButton(
		onPressed: () {
			Navigator.pop(context);
		},
		child: const Text('Back!'),
		), // ElevatedButton
	), // Center
	); // Scaffold
}
}

class ThirdRoute extends StatelessWidget {
const ThirdRoute({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: const Text("Tap Me Page"),
		backgroundColor: Colors.green,
	), // AppBar
	); // Scaffold
}
}
