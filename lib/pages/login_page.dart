import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_project/utils/myroutes.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool buttonChanged = false;
  final _formKey = GlobalKey<FormState>();
  moveToFun(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        buttonChanged = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);

      setState(() {
        buttonChanged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.primaryColor,
        child: SingleChildScrollView(
            child: Column(
      children: [
        Image.asset(
          "assets/images/login.png",
        ),
        const SizedBox(height: 20),
        Text(
          "Login $name",
          style: GoogleFonts.lato(
              textStyle:
                   const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 30)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username field is empty.";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter username",
                    labelText: "Username",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password field is empty.";
                      } else if (value.length < 8) {
                        return "Password length must be greater than 7.";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                    )),
                const SizedBox(height: 60),
                //Button with transition
                Material(
                  //Doing this for repel effect on button
                  //Decoration of any child overrides main decoration so we should do it in start
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(buttonChanged ? 40 : 7),
                  child: InkWell(
                    onTap: () async {
                      moveToFun(context);
                    },
                    //Ink: good for repel effect
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: 40,
                      width: buttonChanged ? 40 : 120,
                      alignment: Alignment.center,
                      child: buttonChanged
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                    ),
                  ),
                )

                // SizedBox(
                //   height: 40,
                //   width: 120,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.pushNamed(context, MyRoutes.functionRoute);
                //     },
                //     style: ElevatedButton.styleFrom(
                //         backgroundColor: Colors.deepOrange),
                //     child: const Text("Login"),
                //   )
                //   ,
                // )
              ],
            ),
          ),
        )
      ],
    )));
  }
}
