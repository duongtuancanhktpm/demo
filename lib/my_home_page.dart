import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode focus = FocusNode();

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
  return Container(
    decoration: BoxDecoration(border: Border.all(color: Colors.red)),
    padding: const EdgeInsets.all(10.0),
    margin: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        Center(
          child: Text(
            "Form",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(5.0, 5.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
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
                                      FocusScope.of(context).unfocus();
                                      nameController.text = "resset name";
                                      ageController.text = "0";
                                      Navigator.pop(context);
                                    })
                              ],
                            ))
                  }),
        )
      ],
    ),
  );
}
