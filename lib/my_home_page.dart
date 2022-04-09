import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: HomeView(context)),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("canh.dt init");
  }
}

Widget HomeView(BuildContext context) {
  String name = "name";
  int age = 0;
  TextEditingController nameController =
      new TextEditingController(text: "init name");
  TextEditingController ageController = new TextEditingController(text: "0");
  return Column(
    children: [
      Center(
        child: Text("Form"),
      ),
      TextField(
        controller: nameController,
        decoration: new InputDecoration.collapsed(hintText: "name"),
      ),
      TextFormField(
        controller: ageController,
        decoration: new InputDecoration.collapsed(hintText: "age"),
        keyboardType: TextInputType.number,
      ),
      Center(
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.cyan, primary: Colors.white),
            child: Text("submit"),
            onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text("information"),
                            content: Text(
                                "name: ${nameController.text} age: ${ageController.text}"),
                            actions: [
                              TextButton(
                                  child: Text("ok"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    nameController.text = "resset name";
                                    ageController.text = "0";
                                  })
                            ],
                          ))
                }),
      )
    ],
  );
}
