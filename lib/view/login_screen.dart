import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  final LoginController l=Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
    //
      body: Container(
          alignment: Alignment.center,
          color: Color.fromARGB(255, 251, 239, 239),
          child: Padding(
              padding: const EdgeInsets.all(30),
              child:
//Inner Container

                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      height: 400,
                      width: 500,
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Login",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 255, 50, 35))),
                          const SizedBox(
                            height: 40,
                          ),
//Email

                          TextField(
                            controller: email,
                            decoration: InputDecoration(
                                hintText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                suffixIcon: const Icon(Icons.person)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

//Password

                          TextField(
                            obscureText: l.obscure,
                            controller: password,
                            decoration: InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      l.togglepassword();
                                    },
                                    child: l.obscure
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility))),
                          ),
                           SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
//Button

                          ElevatedButton(
                              onPressed: () {
                                if (email.text.isNotEmpty &&
                                    password.text.isNotEmpty) {
                                  l.loginwithEmiailAndPassword(
                                      email.text, password.text);
                                } else {
                                  Get.snackbar(
                                    "Enter email and password",
                                    "",
                                    backgroundColor: Colors.white,
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                }
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(fontSize: 20),
                              ))
                        ],
                      )))),
    );
  }
}
