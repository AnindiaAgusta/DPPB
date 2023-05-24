import 'package:flutter/material.dart';

// void main() => runApp(const SecondPage());

class SecondPage extends StatelessWidget {
  final List<String> data;
  //final String kiriman;
  const SecondPage({super.key, required this.data});

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Container(
        child: Center(
          child: Text(data[0]),
        ),
      ),
    );
  }
}