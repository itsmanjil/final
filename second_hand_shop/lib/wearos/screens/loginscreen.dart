import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:wear/wear.dart';

import '../../repository/userrepository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'admin');
  final _passwordController = TextEditingController(text: 'admin');

  _navigateToScreen(bool isLogin) {
    if (isLogin) {
      Navigator.pushReplacementNamed(context, '/nav');
    } else {
      Fluttertoast.showToast(
        msg: "Login failed",
        backgroundColor: Colors.grey,
      );
    }
  }

  _login() async {
    try {
      UserRepository userRepository = UserRepository();

      bool isLogin = await userRepository.login(
        _usernameController.text,
        _passwordController.text,
      );

      if (isLogin) {
        _navigateToScreen(true);
      } else {
        _navigateToScreen(false);
      }
    } catch (e) {
      MotionToast.error(
        description: Text("Error:${e.toString()}"),
      ).show(context); // MotionToast.error

    }
  }

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "The input box is empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          hintText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "The input box is empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 35,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _login();
                          },
                          child: const Text("Login"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
