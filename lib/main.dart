import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MaterialApp(
    home: MainApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String data = '';
  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString("textFile/bangladesh.txt");

    setState(() {
      data = responseText;
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text("Fetch Data From TextFile"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(13),
          child: Text(data,style: new TextStyle(fontSize: 20,color: Colors.black),)),
      ),
    );
  }
}
