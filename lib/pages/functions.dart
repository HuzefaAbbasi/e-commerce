import 'package:flutter/material.dart';
import 'package:login_project/widgets/drawer.dart';

class Functions extends StatelessWidget {
  const Functions({super.key});

  @override
  Widget build(BuildContext context) {
    newFun();
    var gender = isBoy("Boy");
    return (Scaffold(
      appBar: AppBar(
        title: Text(
          "Functions $gender",
          textAlign: TextAlign.center,
        ),
      ),
      body: const Center(
        child: Text("Hi",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 17)),
      ),
      drawer: const MyDrawer(),
    ));
  }

  // For 1 liner returning function, it can only have exressios
  bool isBoy(String boy) => boy.toLowerCase() == "Boy".toLowerCase();
  //{} arguments are optional and they can take default value if not given that
  // value on initialization
  //[] is used to make argument optional
  void newFun({
    String? name,
    int? age = 2,
  }) {}
}
