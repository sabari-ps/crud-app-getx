import 'package:flutter/material.dart';
import 'package:students_app/main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController passCtrl = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    bool isOk = false;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/login.png',
              fit: BoxFit.contain,
              width: 300.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: passCtrl,
                        textAlignVertical: TextAlignVertical.center,
                        maxLength: 4,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Must enter password";
                          }
                          if (val == '1234') {
                            isOk = true;
                          } else {
                            return 'Enter correct passcode';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.password,
                          ),
                          hintText: "PASSCODE",
                          hintStyle: const TextStyle(
                            fontSize: 14.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (isOk) routeController.gotoHomeScreen(true);
                        loginController.storage.write('loggedIn', true);
                      }
                    },
                    icon: const Icon(Icons.login),
                    label: const Text("LOGIN"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
